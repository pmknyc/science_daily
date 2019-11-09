class ScienceDaily::CLI

  attr_accessor :choice, :current_choices

  @@choices = []
  @@current_choice = []
    
  def self.start
  p "in CLI.start method"
    create_articles
    start_doc # Welcome message heredoc
    initial_update_time
    list_articles # call methods: scrape,create article objects, display objects' titles
    choose_or_exit_doc
    create_user_choice # returns: article number chosen OR goodbye message + exit  
    display_article # call methods for 2nd scrape, chosen article's URL, add feature attributes, display details to user
    cite_source_doc
    choose_again_doc #ask user if want to see list again
    #list_articles


    
	end 

	#self.ending_session
	#end

  ####  1ST LEVEL DATA METHODS - HEADLINES LIST ####
  
  def self.create_articles
  p "in CLI.create_articles method"
    ScienceDaily::Article.create_articles # 1st scrape, make article objects   
  end

  def self.initial_update_time
    ScienceDaily::Article.initial_update_time
  end

  def self.list_articles
  	p "in CLI.list_articles method"
    # now iterate all article objects to display list for user
    ScienceDaily::Article.list_articles
  end
  
  def self.create_user_choice
       p 'in CLI#create_user_choice method'
    input = gets.strip # gets User's article choice || exit
    text_input = ['e', 'ex', 'ext','exit'].include?(input.downcase) # 'exit' app options allow typo errors
    digit_input = (1..10).include?(input.to_i) # number choices; 10 articles in "latest headlines" list
    case        # no variable/value input to case
      when text_input
        goodbye_doc
        choice = exit
      when digit_input 
        choice = input.to_i - 1
          @@choices << choice
      else
        puts "I don't understand that. Please try again."
        create_user_choice # recurse until valid user choice
    end
      @@current_choice = choice # set class var of article choice
      binding.pry
  end
  
  # we can track user choices and call prior articles if already defined
  def self.choices  # array, all article choices in order made by user 
    @@choices       # choices to 'exit' omitted from @@choices
  end

  def self.user_choice
    @@current_choice # choice to 'exit' omitted from this array
  end


  #### END 1ST LEVEL - list articles METHODS ####
  
# HEREDOCS SECTION: user interaction messages
  # ?? TODO: 1. using HEREDOC with tick marks <<-'HEREDOC' - how that helps with alignment
  #             make Headlines Updated line INDENT! it's flush left
  #          2. how to CLEAR console screen then display doc?
  def self.start_doc
    # ?? Do a clear console - Ruby command?

    puts <<-'WELCOME'

                    Welcome to Science Daily News

             Breaking news in science from around the world!
                     Headlines Updated: #{ScienceDaily::Article.initial_update_time}

    WELCOME
  end
      
  def self.choose_or_exit_doc
    puts <<~CHOICE
      
      To learn more about a headline, type its number then press <Enter>.

      To exit the application, enter "e" or "exit".
   
      CHOICE
  end

  def self.display_article
    p "in CLI #display_article"
    article = ScienceDaily::Article.add_article_features
    puts <<~ARTICLE

          #{article.subtitle}     
          
          Posted:       #{article.date_posted}
          Source:       #{article.source}
          Abstract:             
          #{article.abstract}

          Full article: "#{ScienceDaily.site}#{article.url}"
 
    ARTICLE

  end

  def self.choose_again_doc
    puts <<~ANOTHER
      
    Fascinating things going on in science, right?!
      
      If you want to see more, press the letter "L"
      To exit the application, enter "e" or "exit".
 
    ANOTHER
  end
      
  def self.cite_source_doc
    puts <<~CITE
      
      Acknowledgment:
      Content is sourced from https://sciencedaily.com
      and complies with that site's permissions for use.
      We ask you also to abide by Science Daily's terms of use, found here:
      https://www.sciencedaily.com/terms.htm

      CITE
  end

  def self.goodbye_doc
    puts <<~BYE
      
    **** Thank you! We hope you found something fascinating! ****
    
              Headlines are updated many times each day 
                Please come again to see the latest 
                science FACTS instead of FAKE NEWS!
    
    *************************************************************

    BYE
  end
end # class CLI end