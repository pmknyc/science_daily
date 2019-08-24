class ScienceDaily::CLI

  attr_accessor :choice, :choices

  @@choices = []
  
  def self.start
    start_doc # Welcome message heredoc
    list_articles # call methods: scrape,create article objects, display objects' titles
    choose_or_exit_doc
    get_user_choice # returns: article number chosen OR goodbye message + exit  
    display_chosen_article # call methods for 2nd scrape, chosen article's URL, add feature attributes, display details to user
    #choose_another_doc # asks user if want to choose another article in same list

    #   ?? Beth S: ADD OPTION s to choose another article and don't rescrape
    
 end 

  ####  1ST LEVEL DATA METHODS - HEADLINES LIST ####
  
  def self.list_articles
    ScienceDaily::Article.create_articles # 1st scrape, make article objects   
    # now iterate all article objects to display list for user
    ScienceDaily::Article.list_articles
  end
  
  def self.get_user_choice
       p 'in CLI#get_user_choice method'
    input = gets.strip # gets User's article choice || exit
    text_input = ['e', 'ex', 'ext','exit'].include?(input.downcase) # 'exit' app options allow typo errors
    digit_input = (1..10).include?(input.to_i) # number choices; 10 articles in "latest headlines" list
    case        # no variable/value input to case
      when text_input
        goodbye_doc
        choice = exit
      when digit_input
        choice = input.to_i
      else
        puts "I don't understand that. Please try again."
        get_user_choice # recurse until valid user choice
    end
    @@choices << (@@choice = choice - 1) # set class var of article choice, as array index value
  end
  
  def self.choices  # array, all article choices in order made by user 
    @@choices       # choices to 'exit' omitted from @@choices
  end

  #### END 1ST LEVEL - list articles METHODS ####

  def self.use_choice
    @@choice
  end

  
#  helper below didn't work, I set up process flow wrong.
#  replace with new CLI finder method above
#  def self.choice_index
#    article_index = get_user_choice - 1
#  end

  def self.display_chosen_article
    p "in CLI #display_chosen_article"
    article = ScienceDaily::Article.add_article_features
    display_article_doc(article)
  end

# HEREDOCS SECTION: user interaction messages
  def self.start_doc
    puts <<~WELCOME

                    Welcome to Science Daily News
      
          Breaking news in science from around the world!
             <<  Headlines Updated: #{ScienceDaily::Article.get_initial_update_time}  >>

    WELCOME
  end
      
  def self.choose_or_exit_doc
    puts <<~CHOICE
      
      To learn more about a headline, enter its NUMBER.

      To exit the application, enter "e" or "exit".
   
      CHOICE
  end

  def self.display_article_doc(article)

    puts <<~ARTICLE

          #{article.subtitle}     
          
          Posted:       #{article.date_posted}
          Source:       #{article.source}
          Abstract:             
          #{article.abstract}

          Full article: "#{ScienceDaily.site}#{article.url}"        
 
    ARTICLE
  end

  def self.choose_another_doc

  end



  def self.cite_source_doc
    puts <<~CITE
      
      Acknowledgment:
      Content is sourced from https://sciencedaily.com
      and complies with that site's permissions for use.
      We ask that you also refer to and abide by Science Daily's terms of use.
      https://www.sciencedaily.com/terms.htm

      CITE
  end

  def self.goodbye_doc
    puts <<~BYE
      
    **** Thank you! We hope you found something fascinating! ****
    
              Headlines are updated many times each day 
              Please come again any time you want some 
              science FACTS instead of FAKE NEWS!
    
    *************************************************************

    BYE
  end
end # class CLI end