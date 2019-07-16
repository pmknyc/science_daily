require "science_daily/version"

module ScienceDaily
  class Error < StandardError
  end
  
  p "in module ScienceDaily but not in a class"
  require 'nokogiri'
  require 'open-uri'
  require 'pry'

end
