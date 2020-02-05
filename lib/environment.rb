p 'In environment.rb: read REQUIRE options'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'colorize'
require 'solargraph'

module ScienceDaily

  class Error < StandardError

  end

  #SITE = 'https://www.sciencedaily.com'
  #
  #def self.site
  #  SITE
  #end
#
  #TOPSCI_PAGE = "#{ScienceDaily.site}/news/top/science/"
#
  #def self.topsci_page
  #  TOPSCI_PAGE
  #end
  p "in environment.rb, end of module ScienceDaily"
end #module ScienceDaily end

# require files statements must be AFTER declaring module b/c
# sdnews executable file calls methods using module
# namespace

require_relative '../lib/science_daily/scraper.rb'
require_relative '../lib/science_daily/cli.rb'
require_relative '../lib/science_daily/article.rb'
require_relative '../lib/science_daily/version'
