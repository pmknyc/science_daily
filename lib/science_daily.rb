# frozen_string_literal: true

p 'lib/science_daily.rb: read gem require options'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'colorize'
require 'colorized_string'
require 'solargraph'
require 'wrapify'

module ScienceDaily

  class Error < StandardError
  end
  p "lib/science_daily.rb, end of module ScienceDaily"

end #module ScienceDaily end

# require files statements must be AFTER declaring module b/c
# sdnews executable file calls methods using module
# namespace

require_relative '../lib/science_daily/scraper.rb'
require_relative '../lib/science_daily/cli.rb'
require_relative '../lib/science_daily/article.rb'
require_relative '../lib/science_daily/version'
p 'lib/science_daily.rb, finished reading file requires'