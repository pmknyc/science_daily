# frozen_string_literal: true

class ScienceDaily::Scraper
  SITE = 'https://www.sciencedaily.com'
  LIST_PAGE = "#{SITE}/news/top/science/"

  # use all Class methods b/c only want
  #   1 Scraper object at a time, not multiple instances

  # .scrape_list_updated_time
  #   gets current "update time" for
  #   10 Latest News headlines on Top Science page
  #   shows most recent refresh time of headlines
  #   we scrape in .scrape_articles_list method
  def self.scrape_list_updated_time # update time for 10 Latest Headlines"
    scrape = Nokogiri::HTML(open(LIST_PAGE))
    update_text = scrape.css('div#time').text
    updated = update_text.delete_prefix('updated ').chop # clean up to show only time of day
  end

  # .scrape_articles_list: gets list of articles
  #   from Latest News section of Top Science page
  #   Call this method to to use for scraping article details
  def self.scrape_articles_list
    p 'Scraper: begin .scrape_articles_list'
    scrape = Nokogiri::HTML(open(LIST_PAGE))
    articles = scrape.css('ul#featured_shorts li')
  end

  # User chooses article for more info:
  #  get input from CLI#get_user_choice
  #  convert input to index of an article object in Article.all array
  #  get that article's article.url attrib & interpolate it onto SITE URL
  #     to define the scrape site
  # an Article method that calls this scrape method to read features &
  # use as instance vars/attributes

  def self.scrape_article_features(chosen_article)
    p 'in Scraper: .scrape_article_features'
    full_url = "#{SITE}#{chosen_article.url}"
    scrape = Nokogiri::HTML(open(full_url))
    chosen_article.subtitle = scrape.css('h1#headline').text.gsub(/\w+/){ |word| word.capitalize}
    chosen_article.date_posted = scrape.css('dd#date_posted').text
    chosen_article.source = scrape.css('dd#source').text
    chosen_article.abstract = scrape.css('dd#abstract').text
    chosen_article.full_url = full_url
    chosen_article
  end
end # class end
