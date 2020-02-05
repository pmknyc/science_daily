# frozen_string_literal: true

class ScienceDaily::Scraper

  SITE = 'https://www.sciencedaily.com'
  TOPSCI_PAGE = "#{SITE}/news/top/science/"

  def self.articles_list 
    p 'in Scraper.articles_list'
    scrape =  Nokogiri::HTML(open(TOPSCI_PAGE))
    articles = scrape.css('ul#featured_shorts li')
    articles.each do |headline| 
      title = headline.css('a').text
      url = headline.css('a').attr('href').value
      ScienceDaily::Article.new(title, url)
    end
  end
 
  def self.topsci_headlines_update #most recent headlines list update time
    p "in Scraper.topsci_headlines_updates"
    scrape = Nokogiri::HTML(open(TOPSCI_PAGE))
    update_time = scrape.css('div#time').text.delete_prefix('updated ').chop
    update_time
  end

  def self.article_features(chosen_article)
    p 'in Scraper.article_features'
    a = chosen_article
    a.full_url = "#{SITE}#{a.url}"
    scrape = Nokogiri::HTML(open(a.full_url))
    a.subtitle = scrape.css('h1#headline').text.gsub(/\w+/){ |word| word.capitalize}
    a.date_posted = scrape.css('dd#date_posted').text
    a.source = scrape.css('dd#source').text
    a.abstract = scrape.css('dd#abstract').text
    a  #article now has attributes
  end
end # class end
