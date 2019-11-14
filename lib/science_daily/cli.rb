class ScienceDaily::CLI

  attr_accessor :choice, :current_choices

  @@choices = []
	@@current_choice = -1
	    
  def self.start
  p "in CLI.start method"
		create_articles
		initial_update_time
    start_doc # Welcome message
    list_articles # call methods: scrape,create article objects, display objects' titles
		choose_or_exit_doc
	  user_chooses # list headlines, article number or exit  
    display_article # calls Article.add_article_features
    cite_source_doc
		choose_again_doc #ask user if want to see list again
		user_chooses
		
   
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
  
  def self.user_chooses
       p 'in CLI#user_chooses method'
    input = gets.strip 
		list = input.downcase == 'l'
		goodbye = ['e', 'ex', 'ext','exit'].include?(input.downcase) 
    number = (1..10).include?(input.to_i) #always 10 articles in "latest headlines"
		case        # no variable/value input to case
			when list
				choice = list_articles
      when goodbye
        goodbye_doc
        choice = exit
      when number 
        choice = input.to_i - 1
        @@choices << choice
      else
        puts "I don't understand that. Please try again."
        user_chooses # recurse until valid choice
    end
			@@current_choice = choice # set class var of article choice
			@@current_choice
  end
  
  def self.choices # tracks user article choices
    @@choices  # array of article choices
  end

  def self.current_choice
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
		if 
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
      
    Hey, scientists figure out cool stuff!
      
      Want to see more? Enter the letter "l"
      Ready to exit the app? Enter "e" or "exit"
 
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
    
              Headlines are updated many times a day 
                Please come again to see the latest 
                science FACTS instead of FAKE NEWS!
    
    *************************************************************

		BYE
		sleep(5)
  end
end # class CLI end