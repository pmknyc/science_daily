class ScienceDaily::Scraper

  @@all = []
  @@site = "https://www.sciencedaily.com/news/top/science/"
  @@page = Nokogiri::HTML(open(@@site))
  
  # use all Class methods b/c only want 
  #   1 Scraper object at a time, not multiple instances
    
  def self.all
    @@all
  end

    # only ONE instance of Scraper needed
    # ??  at initialize, check count of @@all
    # ??  if count > 0, then set @@all = []      

  def self.reset
    @@all = [] if self.all.length > 0
    p "ran Scraper.reset; @@all is now #{@@all}"
  end
  
    # first scrape gets all articles titles & 
    # URL to use for scraping article details
  def self.scrape_articles_list
    p "begin self.scrape_articles_list\n"
    @@all << self
    articles = @@page.css("ul#featured_shorts li") 
    #p articles
 
    
    # raw list of titles and 
    # article URL e.g. /releases/2019/07/190718140440.htm
    articles.each do |h|       p h.css("a").text, h.css("a").attr("href").value
    end
  end



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

end #class end