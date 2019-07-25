
class ScienceDaily::Article

  attr_accessor :title, :url, :date_posted, :subtitle, :source, :abstract

# ?? initialize with optional attributes
#   so that on first scrape we get title, url for article & date_posted
#   then on second scrape we use url to scrape details: subtitle, source, summary
  def initialize(title, url)
    # use first scrape data to instantiate
    @title = title
    @url = url
  end


# call from CLI:  when user chooses Headlines =>
  def self.get_articles_list
    ScienceDaily::Scraper.scrape_articles_list
  end

#  calls first scrape 
#  makes Article objects and assigns .title attr & URL for details
#
# 

# method that makes a new Article and adds .title attribute


end #class end