# frozen_string_literal: true

class ScienceDaily::Article
  
  attr_accessor :list_updated, :subtitle, :source, :abstract, :date_posted
  #  :full_url
  # ?? for accessor vars, set default value in case the attrib doesn't exist, e.g. subtitle
  attr_reader :title, :url  # protect these attrib as keys to identify article;
                            # useful if/when add feature to see updates
  @@all = []

  def initialize(title, url) # use first scrape data to instantiate
    @title = title
    @url = url
    @@all << self
  end

  # @@all articles
  def self.all
    @@all
  end

  ####  1ST LEVEL DATA METHODS - HEADLINES LIST ####

  # .create_articles;  called from CLI
  #    calls Scraper method for 1st scrape
  #    Scraper method calls Article.new 
  def self.create_articles
    ScienceDaily::Scraper.scrape_articles_list
  end

  # .get_initial_update_time = list's update time at start of app
  #  assign @list_updated as attribute to all articles
  def self.get_initial_update_time
    time = ScienceDaily::Scraper.scrape_list_updated_time
    all.each {|article| article.list_updated = time if !article.list_updated}
  end
      # ?? when add option for user to check if any updates since starting
      # the app, add a different "update time" method for that scenario

  def self.list_articles # called from CLI, lists headlines to console
    self.all.collect.with_index(1) do |a, i| 
      unless i > 9
        puts " #{i}. #{a.title}"
      else 
        puts "#{i}. #{a.title}"
      end
    end
  end

 
  #     <?? get_initial_update_time
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
    # ?? if find_chosen_article
    ScienceDaily::Scraper.scrape_article_features(self.find_chosen_article)
  end
 
end # class end
