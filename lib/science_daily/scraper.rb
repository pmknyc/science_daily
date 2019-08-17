class ScienceDaily::Scraper

  SITE = "https://www.sciencedaily.com"
  LIST_PAGE = "#{SITE}/news/top/science/"
  
  # use all Class methods b/c only want 
  #   1 Scraper object at a time, not multiple instances

  # First scrape gets list of articles 
    # from Latest News section of Top Science page 
    # AND scrapes current "update time" for that list
    # Call method to to use for scraping article details
  def self.scrape_list_updated_time #update time for 10 Latest Headlines"
    p "Scraper: begin .scrape_list_updated_time"
    scrape = Nokogiri::HTML(open(LIST_PAGE))
    update_text = scrape.css("div#time").text
    updated = update_text.delete_prefix('updated ').chop #clean up to show only time of day
  end
  
  def self.scrape_articles_list
    p "Scraper: begin .scrape_articles_list"
    scrape = Nokogiri::HTML(open(LIST_PAGE))
    articles = scrape.css("ul#featured_shorts li") 
  end

# User chooses article for more info:
#  get input from CLI#get_user_choice 
#  convert input to index of an article object in Article.all array
#  get the article.url attrib; interpolate it onto SITE URL as suffix
#     to define the scrape site 
# an Article method that calls this scrape method 
  def self.scrape_article_features
    p "in Scraper.scrape_article_features"
    p article.css("col-sm-8")
      #("dl.dl-horizontal dl-custom dt").text
      headline = article.css("h1#headline").text
      puts article.css("dd#date_posted").text
      puts article.css("dd#source").text
      puts article.css("dd#abstract").text
  end 

end #class end