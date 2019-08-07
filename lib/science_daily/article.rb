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

# @@all articles
  def self.all
    @@all
  end

# call from CLI at start:
#   => runs 1st scrape; latest headlines list
  def self.create_articles
    list = ScienceDaily::Scraper.scrape_articles_list
    # iterates list to make article objects
    # and assign each a @title and @url attributes
      # example URL:  /releases/2019/07/190718140440.htm
    list.each do |headline| 
      title = headline.css("a").text 
      url = headline.css("a").attr("href").value
      self.new(title, url)
    end
  end

end #class end