# frozen_string_literal: true

p 'science_daily.rb: read REQUIRE options'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'colorize'
require 'solargraph'

module ScienceDaily

  class Error < StandardError
  end
  p "in lib/science_daily.rb, end of module ScienceDaily"

end #module ScienceDaily end

# require files statements must be AFTER declaring module b/c
# sdnews executable file calls methods using module
# namespace

require_relative '../lib/science_daily/scraper.rb'
require_relative '../lib/science_daily/cli.rb'
require_relative '../lib/science_daily/article.rb'
require_relative '../lib/science_daily/version'