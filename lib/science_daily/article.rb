# frozen_string_literal: true

class ScienceDaily::Article
  
  attr_accessor :list_updated, :subtitle, :source, :abstract, :date_posted, :full_url
  attr_reader :title, :url 
 
  @@all = []
  @@updates = [] #track articles update times
  @list_updated = []

  def initialize(title, url) # use first scrape data to instantiate
    @title = title
    @url = url
    @@all << self if @@all.none?(self)
  end

  def self.all
    @@all
  end

  def self.updates
    @@updates
  end

  ####  1ST LEVEL DATA METHODS - HEADLINES LIST ####

  # TO DO: fix update times methods; separate methods for 
  #       first time Topsci page updated when session started,
  #       and a time_updater method to add new update times to @@updates
       
  # .create_articles
  #   called from CLI; Scraper method calls Article.new 
  def self.create_articles
    ScienceDaily::Scraper.articles_list #initializes objects
  end  

  def self.topsci_headlines_latest_update #most recent time (string) list was updated
    update_time = ScienceDaily::Scraper.topsci_headlines_update
    @@updates << update_time if @@updates.none?(update_time) #prevent repeated times in array
  end

  def self.add_list_updated #time list updated becomes article attribute
    update = topsci_headlines_latest_update
    self.all.each do |article| 
      article.list_updated << update if article.list_updated.none?(update)
    end
  end
    
  #  #    ?? topsci_list_update_time
  #       use later when add feature for user to "check for updates"
  #       use & assign as attribute for all article objects
  #       reason: allows articles to get new "update time"; this attrib
  #       will reveal which articles most recently updated
  #      ?? when add option for user to check if any updates since starting
  # the app, add a different "update time" method for that scenario

  def self.list_articles # called from CLI, lists headlines to console
    puts "\nHeadlines Updated: #{self.updates.last} \n\n"
    self.all.each.with_index(1) do |a, i|
      unless i > 9
        puts " #{i}. #{a.title}"
      else 
        puts "#{i}. #{a.title}"
      end
    end
    puts "\n"
    ScienceDaily::CLI.choose_or_exit_doc
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
      ScienceDaily::Scraper.article_features(self.chosen_article)
    else
      chosen_article
    end
  end
 
end # class end
