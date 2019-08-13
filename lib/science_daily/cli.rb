class ScienceDaily::CLI

  attr_reader :list
  
  def initialize
  end

  def start
    start_doc # Welcome message heredoc
    
    ScienceDaily::Article.create_articles # 1st scrape, make article objects   
  
    list_articles # Display article headlines
    #   call Article methods to run first scrape  
    get_user_choice # article number to see OR exit app
  
    # display_article_chosen if 'exit' not chosen in #get_user_choice
    #scrape_article_features # call Article.add_article_features
  end

  def list_articles
    ScienceDaily::Article.all.collect.with_index(1) do |a, i| 
      unless i == 10
        puts " #{i}. #{a.title}"
      else 
        puts "#{i}. #{a.title}"
      end
      # @list << 
    end
    p self.list
  end

# ?? TODO pseudocode how to get & convert number vs string input
#   match input to any? in array of possible choices
#    ['e', 'exit', 'ext', ('1'..'10')]
#      how to work with ranges as array elements
  def get_user_choice
    choose_or_exit_doc 
    p 'in CLI#get_user_choice method'
    input = gets.strip # gets User's article choice || exit
    text_input = ['e', 'exit', 'ext'].include?(input.downcase) # 'exit' app choice: options  allow typo errors
    digit_input = (1..10).include?(input.to_i) # number choices; 10 articles in "latest headlines" list
    #choice = nil
    case
      when text_input
        #p "#{text_input == true}"
        choice = exit
      when digit_input
        p "digit_input: #{(digit_input == true)}"
        choice = input.to_i
      else
        puts "I don't understand that. Please try again."
        get_user_choice # recurse until valid user choice
    end
    puts "User choice: #{choice}"
     choice
  end

# heredocs for user interaction
#   (?? not used for "updated" articles list feature - if added)
  def start_doc
    puts <<~WELCOME

                    Welcome to Science Daily News
      
      Breaking news headlines in science from around the world!
      Updated:  ??update time here??

    WELCOME
  end
      
  def choose_or_exit_doc
    puts <<~CHOICE
      
      Enter the NUMBER of a headline that fascinates you to learn more.

      To exit the application, type "e" or "exit".
   
      CHOICE
  end

  def again_heredoc
    # ScienceDaily.com 
    # To continue, type a choice and press <Enter>\n" 
    # h     see updated Headlines"
    # e     exit the application\m"
  end
  
end # class CLI end