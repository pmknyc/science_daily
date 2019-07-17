require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  site = "https://www.sciencedaily.com/news/top/science/"

  page = Nokogiri::HTML(open(site))
  headlines = page.css("ul#featured_shorts li") 

  headlines.each {|h| puts h.css("a").text, h.css("a").attr("href").value}

  headlines.each do |h|
    show = "https://www.sciencedaily.com#{h.css("a").attr("href").value}"
    article = Nokogiri::HTML(open(show))
    puts ""
    puts article.css("h2#subtitle").text
    puts article.css("dd#date_posted").text
    puts article.css("dd#source").text
    puts article.css("dd#abstract").text
  end 

p headlines.count

 #enter a selector that you know you want to use in your scrape - i.e. div.main-content  or h1.title 

#if the result is an empty array [], the content you want is probably being loaded with javascript


#.text works on an array
#['href'] does NOT work on an array 


#if it's a really long result and you can't tell if the content you want is in there, try chaining .text to the end.
  #for example: 
    #page.css("div.main-content").text  OR  #page.css("div.main-content")[0].text


# "Finished running code"

end #class end
