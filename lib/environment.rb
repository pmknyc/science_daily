require 'nokogiri'
require 'open-uri'
require 'pry'

p 'In environment.rb: read REQUIRE options'

module ScienceDaily

  class Error < StandardError
  end

  SITE = 'https://www.sciencedaily.com'
  
  def self.site
    SITE
  end

  LIST_PAGE = "#{ScienceDaily.site}/news/top/science/"

  def self.list_page
    LIST_PAGE
  end

  p "in environment.rb, end of module ScienceDaily"
end #module ScienceDaily end

# require files statements must be AFTER declaring module b/c
# sdnews executable file calls methods using module
# namespace

require_relative '../lib/science_daily/scraper.rb'
require_relative '../lib/science_daily/cli.rb'
require_relative '../lib/science_daily/article.rb'
require_relative '../lib/science_daily/version'
