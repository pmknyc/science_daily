class ScienceDaily::Scraper

  @@site = "https://www.sciencedaily.com/news/top/science/"
  @@page = Nokogiri::HTML(open(@@site))
  @@article = 
  
  # use all Class methods b/c only want 
  #   1 Scraper object at a time, not multiple instances

  # First scrape gets list of articles 
    # from Latest News section of Top Science page 
    # Call method to to use for scraping article details
  def self.scrape_articles_list
    p "Scraper: begin .scrape_articles_list\n"
    articles = @@page.css("ul#featured_shorts li") 
  end

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