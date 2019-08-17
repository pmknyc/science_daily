class ScienceDaily::Article

  attr_accessor :subtitle, :source, :abstract, :date_posted
  # for accessor vars, set default value in case the attrib doesn't exist, e.g. subtitle
  # set reader attrib at Initialize
  attr_reader :title, :url, :list_updated
  @@all = []

# the .create_articles method does first scrape and calls #initialize
#   to create all 10 articles in Latest Headlines list, with title & url attributes
  def initialize(title, url, updated = "unknown") # use first scrape data to instantiate
    @title = title
    @url = url
    @list_updated = updated
    @@all << self
  end

# @@all articles
  def self.all
    @@all
  end

# .create_articles;  called from CLI
#    calls Scraper method that runs 1st scrape
#    to get latest headlines list
  def self.create_articles
    updated = ScienceDaily::Scraper.scrape_list_updated_time
    articles = ScienceDaily::Scraper.scrape_articles_list
    articles.each do |headline|   # iterates list to make article objects
      title = headline.css("a").text 
      url = headline.css("a").attr("href").value
      self.new(title, url, updated)  # assign @title, @url, @list_updated attributes
    end
  end

  def get
  def self.add_article_details
    p "in Article.add_article_details"

  end
end #class end