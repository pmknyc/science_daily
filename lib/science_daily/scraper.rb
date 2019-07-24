class ScienceDaily::Scraper

  @@all = []
  
    def initialize
      @@all << self
      p "Scraper init"
      p  @@all
    end

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
    def self.scrape_headlines 
      p "begin self.scrape_headlines"
      site = "https://www.sciencedaily.com/news/top/science/"
      page = Nokogiri::HTML(open(site))
      headlines = page.css("ul#featured_shorts li") 
    
      # raw list of titles and 
      # article URL e.g. /releases/2019/07/190718140440.htm
        headlines.each {|h| puts h.css("a").text, h.css("a").attr("href").value}

        end
    end

  #  # concatenates full URL for each article's page
  #  headlines.each do |h|
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
  end   #scrape_headlines

    def self.scrape_attributes
    p "in Scraper.scrape_attributes"
      puts article.css("dd#date_posted").text
      puts article.css("dd#source").text
      puts article.css("dd#abstract").text
    end 
=end
end #class end

# Beth's scraper tool tips:
#enter a selector that you know you want to use in your scrape - i.e. div.main-content  or h1.title 

#if the result is an empty array [], the content you want is probably being loaded with javascript
#.text works on an array
#['href'] does NOT work on an array 

#if it's a really long result and you can't tell if the content you want is in there, try chaining .text to the end.
  #for example: 
    #page.css("div.main-content").text  OR  #page.css("div.main-content")[0].text