# frozen_string_literal: true

class ScienceDaily::Article
  
  attr_accessor :list_updated, :subtitle, :source, :abstract, :date_posted, :full_url
  attr_reader :title, :url  # protect as ID keys for article
 
  @@all = []
  @@updates = [] #track articles update times

  def initialize(title, url) # use first scrape data to instantiate
    @title = title
    @url = url
    @@all << self
  end

  # @@all articles
  def self.all
    @@all
  end

  def self.updates
    @@updates
  end

  ####  1ST LEVEL DATA METHODS - HEADLINES LIST ####

  # .create_articles;  called from CLI
  #    calls Scraper method for 1st scrape
  #    Scraper method calls Article.new 
  def self.create_articles
    ScienceDaily::Scraper.scrape_articles_list # initializes objects
    all.each do |article| 
      if !article.list_updated
        article.list_updated = ScienceDaily::Scraper.scrape_list_updated_time 
      end
    end
  end

  # .initial_update_time = list's update time at start of app
  #  assign @list_updated as attribute to all articles
  def self.initial_update_time
    time = ScienceDaily::Scraper.scrape_list_updated_time
    if @@updates.size == 0 # ?? see if this works to track all times
      @@updates << time 
      @@updates.first
    end
  end
  
      #  #     <?? initial_update_time
  #       use later when add feature for user to "check for updates"
  #       use & assign as attribute for all article objects
  #       reason: allows articles to get new "update time"; this attrib
  #       will reveal which articles most recently updated
  #      ?? when add option for user to check if any updates since starting
      # the app, add a different "update time" method for that scenario

  def self.list_articles # called from CLI, lists headlines to console
    self.all.each.with_index(1) do |a, i|
      print "  " 
      unless i > 9
        puts " #{i}. #{a.title}"
      else 
        puts "#{i}. #{a.title}"
      end
    end
  end

  #### END 1ST SCRAPE DATA METHODS ####


  #### 2nd LEVEL DATA METHODS -- CHOSEN ARTICLE ####

  def self.chosen_article
    p "in Article.chosen_article"
    all[ScienceDaily::CLI.current_choice] # finds article by index in Article.all
  end

  def self.add_article_features
    p 'in Article.add_article_features'
    if !chosen_article.subtitle # already created
      ScienceDaily::Scraper.scrape_article_features(self.chosen_article)
    else
      chosen_article
    end
  end
 
end # class end
