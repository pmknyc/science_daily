class ScienceDaily::Article

  attr_accessor :list_updated, :subtitle, :source, :abstract, :date_posted, :full_url
  # for accessor vars, set default value in case the attrib doesn't exist, e.g. subtitle
  attr_reader :title, :url 
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

####  1ST LEVEL DATA METHODS - HEADLINES LIST ####  

# .create_articles;  called from CLI
#    calls Scraper method that runs 1st scrape
#    to get latest headlines list
  def self.create_articles
    updated = self.get_update_time
    articles = ScienceDaily::Scraper.scrape_articles_list
    articles.each do |headline|   # iterates list to make article objects
      title = headline.css("a").text 
      url = headline.css("a").attr("href").value
      self.new(title, url, updated)  # assign @title, @url, @list_updated attributes
    end
  end

# .get_update_time - Helper
#   finds list "update time" during .create_articles
#   use & assign as attribute for all article objects
  def self.get_update_time
    ScienceDaily::Scraper.scrape_list_updated_time
  end
#### END 1ST SCRAPE DATA METHODS ####

#### 2nd LEVEL DATA METHODS -- CHOSEN ARTICLE ####

  def self.add_article_features
    p "in Article.add_article_features"
    chosen_article = self.chosen_article
    article_features = ScienceDaily::Scraper.scrape_article_features(chosen_article)
  end
  
  # Helper - identifies chosen article from @@all with user's chosen index
  def self.chosen_article
    article_index = ScienceDaily::CLI.choice_index
    self.all[article_index] # finds article by index in Article.all
  end

  def display_chosen_article
    article_features = self.add_article_features
    article.subtitle = scrape.css("h1#headline").text
    article.date_posted = scrape.css("dd#date_posted").text
    article.source = scrape.css("dd#source").text
    article.abstract = scrape.css("dd#abstract").text
    article.full_url
  end
  
end #class end