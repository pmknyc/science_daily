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