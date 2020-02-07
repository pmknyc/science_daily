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

require_relative '../config/environment'