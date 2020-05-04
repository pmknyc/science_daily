# frozen_string_literal: true

class ScienceDaily::Article
  
  attr_accessor :subtitle, :source, :abstract, :date_posted, :full_url
  attr_reader :title, :url 
 
  @@all = []
  @@updates = [] #track articles' update times for future features
  
  def initialize(title, url) # from first scrape data initialize == Lifecycle method in Ruby
    @title = title
    @url = url
    @@all << self if @@all.none?(self)
  end

  def self.all
    @@all.sort_by(&:title)
  end

  def self.updates
    @@updates
  end

  ####  1ST LEVEL METHODS - HEADLINES LIST ####

  def self.create_articles
    ScienceDaily::Scraper.articles_list #initializes articles
  end  

  def self.topsci_headlines_latest_update #most recent time list was updated
    update_time = ScienceDaily::Scraper.topsci_headlines_update
    @@updates << update_time if @@updates.none?(update_time) 
  end

  def self.list_articles #top 10 headlines to console
    self.show_topsci_headlines_update_time
      self.all.each.with_index(1) do |a, i|
        unless i > 9
          puts " #{i}. #{a.title}"
        else 
          puts "#{i}. #{a.title}"
        end
      end
      draw_border_line
    ScienceDaily::CLI.choose_or_exit_doc
  end

#  def self.list_articles #top 10 headlines to console
#    self.show_topsci_headlines_update_time
#      self.all.each.with_index(1) do |a, i|
#        unless i > 9
#          puts " #{i}. #{a.title}"
#        else 
#          puts "#{i}. #{a.title}"
#        end
#      end
#      draw_border_line
#    ScienceDaily::CLI.choose_or_exit_doc
#  end

  def self.draw_border_line
    puts "\n#{'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.colorize(:light_blue)}"
  end

  def self.show_topsci_headlines_update_time
    puts "\n#{'Headlines Updated:'.colorize(:light_blue)} #{updates.last} \n\n"
  end

  #### END 1ST SCRAPE DATA METHODS ####


  #### 2nd LEVEL DATA METHODS -- CHOSEN ARTICLE ####

  def self.find_article_or_add_features
    article = find_chosen_article
      if !article.subtitle # if article details not yet added
        ScienceDaily::Scraper.add_article_features(article)
      else
        article #may already have details if user chooses article multiple times
      end
  end
 
  def self.find_chosen_article
    all[ScienceDaily::CLI.current_choice] #finds article by index in Article.all array
  end
end # class end
