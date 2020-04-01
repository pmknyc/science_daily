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

  ####  1ST LEVEL METHODS - HEADLINES LIST ####

  # TO DO: fix update times methods; separate methods for 
  #       first time Topsci page updated when session started,
  #       and a time_updater method to add new update times to @@updates
       
  def self.create_articles
    ScienceDaily::Scraper.articles_list #initializes articles
  end  

  def self.topsci_headlines_latest_update #most recent time list was updated
    update_time = ScienceDaily::Scraper.topsci_headlines_update
    @@updates << update_time if @@updates.none?(update_time) 
  end

  # If an article is in current Top Sci list, get the update time
  #    of that list and add time to each article's array of update times; 
  #    article.list_updated array shows all the headlines lists in which it 
  #    has been included/shown on Top Sci site page throughout the day
  def self.add_list_update_time_to_articles_in_list 
    update = topsci_headlines_latest_update
    self.all.each do |article| 
      article.list_updated << update if article.list_updated.none?(update)
    end
  end

  def self.list_articles # called from CLI, lists headlines to console
    puts "\n             Headlines Updated: #{self.updates.last} \n\n"
    self.all.each.with_index(1) do |a, i|
      unless i > 9
        puts "              #{i}. #{a.title}"
      else 
        puts "             #{i}. #{a.title}"
      end
    end
    puts "\n"
    ScienceDaily::CLI.choose_or_exit_doc
  end

  #### END 1ST SCRAPE DATA METHODS ####


  #### 2nd LEVEL DATA METHODS -- CHOSEN ARTICLE ####

  def self.add_article_features
    p 'Article.add_article_features'
    article = chosen_article
      if !article.subtitle # not already exist
        ScienceDaily::Scraper.article_features(article)
      else
        article
      end
  end
 
  def self.chosen_article
    p "Article.chosen_article - gets CLI.current_choice"
    all[ScienceDaily::CLI.current_choice] #finds article by index in Article.all array
  end
end # class end
