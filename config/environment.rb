p 'In environment.rb: read REQUIRE options'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'colorize'
require 'solargraph'

# require files statements must be AFTER declaring module b/c
# sdnews executable file calls methods using module
# namespace

require_relative '../lib/science_daily/scraper.rb'
require_relative '../lib/science_daily/cli.rb'
require_relative '../lib/science_daily/article.rb'
require_relative '../lib/science_daily/version'
