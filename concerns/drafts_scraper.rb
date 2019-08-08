# SCRAPER CLASS  
#  drafts and scratchpad code 


   # def self.articles_last_update()
   #  div.time)
   # end

  #  # concatenates full URL for each article's page
  #  articles.each do |h|
  #    show = "https://www.sciencedaily.com#{h.css("a").attr("href").value}"
  #    p show
  
=begin 
    # ??  call this method from Article class & Use line below to create Article.new 
      article = Nokogiri::HTML(open(show))
      #  p article
      puts ""
    # ??  use line below to add .title attribute to new Article object
      puts article.css("h2#subtitle").text
    end   
  end   #scrape_articles
    def self.scrape_attributes
    p "in Scraper.scrape_attributes"
       headline = article.css("dl.dl-horizontal dl-custom dt").text
      puts article.css("dd#date_posted").text
      puts article.css("dd#source").text
      puts article.css("dd#abstract").text
    end 
=end

# 8/7/19
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