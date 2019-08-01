
class ScienceDaily::Article

  attr_accessor :title, :url, :date_posted, :subtitle, :source, :abstract
  @@all = []

# at first scrape we initialize all 10 articles in 
#   Latest Headlines list, with title & url attributes
  def initialize(title, url)
    # use first scrape data to instantiate
    @title = title
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

# call from CLI:  when user chooses Headlines =>
#   runs 1st scrape; latest headlines list
  def self.get_articles_list
    ScienceDaily::Scraper.scrape_articles_list
  end

#  calls first scrape 
#  makes Article objects and assigns .title attr & URL for details
#  def create_articles(articles)
#    self.all.each
#  end

#
# 

# method that makes a new Article and adds .title attribute


end #class end