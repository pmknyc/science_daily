# frozen_string_literal: true

class ScienceDaily::Scraper

  SITE = 'https://www.sciencedaily.com'
  TOPSCI_PAGE = "#{SITE}/news/top/science/"

  def self.topsci_headlines_update #update time of most recent headlines list
    p "in Scraper.topsci_headlines_updates"
    scrape = Nokogiri::HTML(open(TOPSCI_PAGE))
    update_time = scrape.css('div#time').text.delete_prefix('updated ').chop
    update_time
  end

  def self.articles_list 
    p 'Scraper.articles_list'
    scrape =  Nokogiri::HTML(open(TOPSCI_PAGE))
    articles = scrape.css('ul#featured_shorts li')
    articles.each do |headline| 
      title = headline.css('a').text
      url = headline.css('a').attr('href').value
      ScienceDaily::Article.new(title, url)
    end
  end

  def self.article_features(chosen_article)
    p 'Scraper.article_features'
    site = Nokogiri::HTML(open("#{SITE}#{chosen_article.url}"))
    chosen_article.full_url = "#{SITE}#{chosen_article.url}"
    chosen_article.subtitle = site.css('h1#headline').text.gsub(/\w+/){|word| word.capitalize}
    chosen_article.date_posted = site.css('dd#date_posted').text
    chosen_article.source = site.css('dd#source').text
    chosen_article.abstract = site.css('dd#abstract').text
    chosen_article  #article now has attributes
  end

end # class end
