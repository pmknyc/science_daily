class ScienceDaily::CLI

  attr_accessor :choice
  
  def self.start
    start_doc # Welcome message heredoc
    list_articles # Call methods to scrape, create article objects, display article headlines list
    choose_or_exit_doc
    get_user_choice # returns: article number chosen OR goodbye message + exit  
    find_chosen_article
    ScienceDaily::Article.add_article_features # call Article.add_article_details
    # display_chosen_article # call methods for 2nd scrape, chosen article's URL, add feature attributes, display details to user
  
      # hard code scrape call for testing - refactor to call local method or Article method
 
  end 

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
    case
      when text_input
        goodbye_doc
        choice = exit
      when digit_input
        choice = input.to_i
      else
        puts "I don't understand that. Please try again."
        get_user_choice # recurse until valid user choice
    end
    @@choice = choice - 1 # set class var of article choice, as array index value
  end

  def self.use_choice
    @@choice
  end

  def self.find_chosen_article
    p "in CLI.find_chosen_article"
    ScienceDaily::Article.all[self.use_choice] # finds article by index in Article.all
  end
#  helper below didn't work, I set up process flow wrong.
#  replace with new CLI finder method above
# #choice_index -- Helper
# call from Article class to help find chosen article in Article.all
#  def self.choice_index
#    article_index = get_user_choice - 1
#  end

 def self.display_chosen_article
              p "in CLI #display_chosen_article"
    ScienceDaily::Article.display_chosen_article
    # call Article method that uses Article internal methods to 
    # find chosen article, initiate scrape for features data
    # and assign features as the article's attributes
    
  end

# HEREDOCS SECTION: user interaction messages
  def self.start_doc
    puts <<~WELCOME

                    Welcome to Science Daily News
      
          Breaking news in science from around the world!
             <<  Headlines Updated: #{ScienceDaily::Article.get_update_time}  >>

    WELCOME
  end
      
  def self.choose_or_exit_doc
    puts <<~CHOICE
      
      To learn more about a headline, enter its NUMBER.

      To exit the application, enter "e" or "exit".
   
      CHOICE
  end

  def self.goodbye_doc
    puts <<~BYE
      
    **** Thank you! We hope you found something fascinating! ****
    
              Headlines are updated many times each day 
              Please come again any time you need some 
              Science FACTS instead of FAKE NEWS!
    
    *************************************************************

    BYE
  end
end # class CLI end