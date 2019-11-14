# frozen_string_literal: true

class ScienceDaily::Scraper

#  SITE = 'https://www.sciencedaily.com'
#  TOPSCI_PAGE = "#{SITE}/news/top/science/"

  def self.scrape_articles_list #from Latest News section of Top Science page
    p 'Scraper: begin .scrape_articles_list'
    scrape =  Nokogiri::HTML(open(ScienceDaily.topsci_page))
    articles = scrape.css('ul#featured_shorts li')
    articles.each do |headline| # make article objects
      title = headline.css('a').text
      url = headline.css('a').attr('href').value
      ScienceDaily::Article.new(title, url) # assign @title, @url
    end
  end

  def self.scrape_list_updated_time # recent update for 10 Latest Headlines"
    scrape = Nokogiri::HTML(open(ScienceDaily.topsci_page))
    update_text = scrape.css('div#time').text
    updated = update_text.delete_prefix('updated ').chop # clean up to show only time of day
  end

  def self.scrape_article_features(chosen_article)
    p 'in Scraper: .scrape_article_features'
    a = chosen_article
    a.full_url = "#{ScienceDaily.site}#{a.url}"
    scrape = Nokogiri::HTML(open(a.full_url))
    a.subtitle = scrape.css('h1#headline').text.gsub(/\w+/){ |word| word.capitalize}
    a.date_posted = scrape.css('dd#date_posted').text
    a.source = scrape.css('dd#source').text
    a.abstract = scrape.css('dd#abstract').text
    #chosen_article.full_url = full_url
    a  #return article, now has attributes
  end
end # class end
