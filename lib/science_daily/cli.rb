class ScienceDaily::CLI

  attr_reader :list
  
  def initialize
  end

  def start
    # tells user what to do
    start_doc
    
    # make article objects
    ScienceDaily::Article.create_articles   
    
    # Display article headlines list: 
    #   call Article methods to run first scrape  
    list_articles

    choose_or_exit_doc
    input_choose = gets.strip.downcase
   # case input_choose
   #   when (/[1-10]/)
   #   
   #     end
   #   when 'e' || 'exit'
   #     exit
   #   else
   #     puts "I don't understand that. Please try again."
   #     start  # recurse
   # end
  end
  
# ask user to choose an article
#  ?? use #collect to hold initial order of list, then compare
#     with *updated* list if user runs app #again 
#     URLs will really determine if article is *new* in update
#     but for UX clarity, should list articles in original order 
#     except put *new* articles on top
#  ?? look up hash methods or ways to keep track of articles order
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

# heredoc to use at start of app 
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
      
      Enter the number of a headline that fascinates you to learn more.
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