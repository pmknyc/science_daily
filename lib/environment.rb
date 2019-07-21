require 'nokogiri'
require 'open-uri'
require 'pry'

module ScienceDaily
  class Error < StandardError
  end
  
  p "in environment.rb, in module ScienceDaily"
end #module ScienceDaily end

require_relative '../lib/science_daily/scraper.rb'
require_relative '../lib/science_daily/cli.rb'
require_relative '../lib/science_daily/article.rb'
#require_relative 'science_daily/version'

  p 'have read the REQUIRE options'

