class ScienceDaily::CLI

  # attr_accessor 
  
  def initialize
  
  end

  def start
    # tells user what to do
    puts "Welcome to Science Daily News\n"
    puts "To continue, type a choice and press <Enter>\n" 
    puts "  h     see updated Headlines"
    puts "  q     Quit the application\m"
    input_start = gets.strip.downcase
    case input_start
      when 'h'
        # call an Article method that runs the scrape
        ScienceDaily::Article.new.create_articles   
      when 'q'
        exit
      else
        puts "I don't understand that. Please try again."
        start
    end
  end
  

# ?? initialize with URL of site to scrape
#   allows for adding other 'top news' category sites 
#   with later versions of app


end # class CLI end