class ScienceDaily::CLI

  # attr_accessor 
  
  def initialize
    
  end

  def start
    # tells user what to do
    puts "Welcome to Science Daily News\n"
    puts 
    puts "to exit the app, type 'exit'"
    input = gets.strip.downcase
    case input
    when 'h'
      # call an Article method that runs the scrape
      ScienceDaily::Scraper.scrape_headlines
    when 'exit'
      exit
    end
  end
  

# ?? initialize with URL of site to scrape
#   allows for adding other 'top news' category sites 
#   with later versions of app


end # class CLI end