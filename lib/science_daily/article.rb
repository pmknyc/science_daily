
class ScienceDaily::Article

  attr_accessor :title, :url, :date_posted, :subtitle, :source, :abstract

# ?? initialize with optional attributes
#   so that on first scrape we get title, url for article & date_posted
#   then on second scrape we use url to scrape details: subtitle, source, summary
  def initialize(*attributes)

  end

# from CLI:  user chooses Headlines =>
#   calls #create_article
# 
  def create_articles
    ScienceDaily::Scraper.scrape_headlines
  end

#  calls first scrape 
#  makes Article objects and assigns .title attr & URL for details
#
# 

# method that makes a new Article and adds .title attribute


end #class end