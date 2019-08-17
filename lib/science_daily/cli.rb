class ScienceDaily::CLI

  def start
    start_doc # Welcome message heredoc
    list_articles # Call methods to scrape, create article objects, display article headlines list
    get_user_choice # returns: article to see OR goodbye message + exit  
    # display_chosen_article # call methods for 2nd scrape, chosen article's URL, add feature attributes, display details to user
    #scrape_article_features # call Article.add_article_details
  end 

  def list_articles
    ScienceDaily::Article.create_articles # 1st scrape, make article objects   
    # now iterate all article objects to display list for user
    ScienceDaily::Article.all.collect.with_index(1) do |a, i| 
      unless i > 9
        puts " #{i}. #{a.title}"
      else 
        puts "#{i}. #{a.title}"
      end
    end
  end

  def get_user_choice
    choose_or_exit_doc 
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
    choice
  end

  def display_chosen_article
    p "in CLI #display_chosen_article"
    article_index = get_user_choice - 1
    chosen = ScienceDaily::Article.all[]


  end

# HEREDOCS SECTION: user interaction messages
  def start_doc
    puts <<~WELCOME

                    Welcome to Science Daily News
      
          Breaking news in science from around the world!
             <<  Headlines Updated: #{ScienceDaily::Article.get_update_time}  >>

    WELCOME
  end
      
  def choose_or_exit_doc
    puts <<~CHOICE
      
      To learn more about a headline, enter its NUMBER.

      To exit the application, enter "e" or "exit".
   
      CHOICE
  end

  def goodbye_doc
    puts <<~BYE
      
    **** Thank you! We hope you found something fascinating! ****
    
              Headlines are updated many times each day 
              Please come again any time you need some 
              Science FACTS instead of FAKE NEWS!
    
    *************************************************************

    BYE
  end
end # class CLI end