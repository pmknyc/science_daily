class ScienceDaily::CLI

  # attr_accessor 
  
  def initialize
  end

  def start
    # tells user what to do
    start_heredoc
    input_start = gets.strip.downcase
    case input_start
      when 'h'
        # call Article class method to run first scrape
        ScienceDaily::Article.get_articles_list  
        ScienceDaily::Article.all.each.with_index(1) do |a, i| 
          unless i == 10
            puts " #{i}. #{a.title}"
          else 
            puts "#{i}. #{a.title}"
          end
        end
      when 'e' || 'exit'
        exit
      else
        puts "I don't understand that. Please try again."
        start  # recurse
    end
  end
  
# ask user to choose an article
  

# ?? initialize with URL of site to scrape
#   allows for adding other 'top news' category sites 
#   with later versions of app

# heredoc to use at initial start of app
  def start_heredoc
    <<~HEREDOC
                    Welcome to Science Daily News
      
      Breaking news headlines in science from around the world!
      Updated:  ??update time here??

      To learn more, enter the number of any headline that fascinates you.
      To exit the application, type "e" or "exit".
   
    HEREDOC
  end
       
  def again_heredoc
    # ScienceDaily.com 
    # To continue, type a choice and press <Enter>\n" 
    # h     see updated Headlines"
    # q     Quit the application\m"
  end
  
end # class CLI end