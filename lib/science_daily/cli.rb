class ScienceDaily::CLI

  attr_reader :list
  
  def initialize
  end

  def start
    start_doc # Welcome message heredoc
    
    ScienceDaily::Article.create_articles # 1st scrape, make article objects   
    list_articles # Display article headlines
    #   call Article methods to run first scrape  

    choose_or_exit_doc # Explain choice options to User
    get_user_choice # article number to see OR exit app
    # display_article_chosen #if 'exit' not chosen in #get_user_choice
    scrape_article_features # call Article.add_article_features

  
  end

  def list_articles
    ScienceDaily::Article.all.collect.with_index(1) do |a, i| 
      unless i > 9
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
    input = gets.strip.to_i # gets User's article choice || exit
      if (1..9).include?(
    )    case input
      when "99"  #temp option while coding Scraper.scrape_article_features
      
      when 'e' || 'exit'
        exit
      else
      puts "I don't understand that. Please try again."
      start  # recurse
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