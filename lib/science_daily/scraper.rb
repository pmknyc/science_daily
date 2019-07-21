class ScienceDaily::Scraper

  def self.scrape_headlines 
    site = "https://www.sciencedaily.com/news/top/science/"
    page = Nokogiri::HTML(open(site))
    headlines = page.css("ul#featured_shorts li") 
    
    # raw list of titles and 
    # article URL e.g. /releases/2019/07/190718140440.htm
    headlines.each {|h| puts h.css("a").text, h.css("a").attr("href").value}

    headlines.each do |h|
      show = "https://www.sciencedaily.com#{h.css("a").attr("href").value}"
# ??  call this method from Article class & Use line below to create Article.new 
      article = Nokogiri::HTML(open(show))
      #  p article
      puts ""
# ??  use line below to add .title attribute to new Article object
      puts article.css("h2#subtitle").text
    end   
  end   #scrape_headlines

    def self.scrape_attributes(#call article)
      puts article.css("dd#date_posted").text
      puts article.css("dd#source").text
      puts article.css("dd#abstract").text
    end 

#enter a selector that you know you want to use in your scrape - i.e. div.main-content  or h1.title 

#if the result is an empty array [], the content you want is probably being loaded with javascript
#.text works on an array
#['href'] does NOT work on an array 

#if it's a really long result and you can't tell if the content you want is in there, try chaining .text to the end.
  #for example: 
    #page.css("div.main-content").text  OR  #page.css("div.main-content")[0].text

end #class end
