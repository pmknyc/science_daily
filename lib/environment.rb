require 'nokogiri'
require 'open-uri'
require 'pry'

p 'In environment.rb: have read REQUIRE options'

module ScienceDaily
  
  class Error < StandardError
  end

    p "in environment.rb, in module ScienceDaily"
end #module ScienceDaily end

# require files statements must be AFTER declaring module b/c
# sdnews executable file calls methods using module
# namespace
#require_relative '../bin/sdnews'
require_relative '../lib/science_daily/scraper.rb'
require_relative '../lib/science_daily/cli.rb'
require_relative '../lib/science_daily/article.rb'
require_relative '../lib/science_daily/version'
