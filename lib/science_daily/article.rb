# frozen_string_literal: true

class ScienceDaily::Article
  attr_accessor :list_updated, :subtitle, :source, :abstract, :date_posted, :full_url
  # for accessor vars, set default value in case the attrib doesn't exist, e.g. subtitle
  attr_reader :title, :url
  @@all = []

  # the .create_articles method does first scrape and calls #initialize
  #   to create all 10 articles in Latest Headlines list, with title & url attributes
  def initialize(title, url, updated = 'unknown') # use first scrape data to instantiate
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
    updated = get_update_time # Helper method 
    articles = ScienceDaily::Scraper.scrape_articles_list
    articles.each do |headline| # iterates list to make article objects
      title = headline.css('a').text
      url = headline.css('a').attr('href').value
      new(title, url, updated) # assign @title, @url, @list_updated attributes
    end
  end

  def self.list_articles # called from CLI, lists headlines to console
    self.all.collect.with_index(1) do |a, i| 
      unless i > 9
        puts " #{i}. #{a.title}"
      else 
        puts "#{i}. #{a.title}"
      end
    end
  end

  # .get_update_time - Helper
  #  uses scrape to get article list's current "update time"
  #  called during .create_articles; 
  def self.get_update_time
    ScienceDaily::Scraper.scrape_list_updated_time
  end
  #     <?? get_update_time
  #       use later when add feature for user to "check for updates"
  #       use & assign as attribute for all article objects
  #       reason: allows articles to get new "update time"; this attrib
  #       will reveal which articles most recently updated
  #     ??>

  #### END 1ST SCRAPE DATA METHODS ####


  #### 2nd LEVEL DATA METHODS -- CHOSEN ARTICLE ####

  def self.find_chosen_article
    p "in Article.find_chosen_article"
    all[ScienceDaily::CLI.use_choice] # finds article by index in Article.all
  end

  def self.add_article_features
    p 'in Article.add_article_features'
    ScienceDaily::Scraper.scrape_article_features(self.find_chosen_article)
  end
 
end # class end
