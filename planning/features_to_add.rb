
	#  Later Features I want to add: 
	*  Sort Headlines Option:  
	-  At startup: choose to see articles list in Date or Alphabetical order?
	-  display list of 10 headlines in order chosen
*  Update Tracker - headlines are updated throughout day
	-  Ask user if want to check for newer Update Time to headlines list.
		 Add to existing choices list: see List, check Update time, Exit
		 -  If Yes, check update:
				scrape 1st page's Update Time (to display)
				scrape 1st page's Headlines list (to compare URLs for new articles since last update)
				show user the new update time headlines list, and FLAG which articles are new to list

###################################	
# FEATURE NOTES: Update Tracker
# 	Store and retrieve all daily headlines lists, tracked
#			with the list's update time.
	#Keep running inventory of list updates throughout day. 
	#Must track Headlines update times with the URL of all articles 
	#that were included in the list at that update time. 
	# How to best organize this? 
	
	# this is one idea I had but not sure it will work:
	# If an article is in current Top Sci list, get the update time
  #    of that list and add time to each article's array of update times; 
  #    article.list_updated array shows all the headlines lists in which it 
  #    has been included/shown on Top Sci site page throughout the day
  def self.add_list_update_time_to_articles_in_list 
    update = topsci_headlines_latest_update
    self.all.each do |article| 
      article.list_updated << update if article.list_updated.none?(update)
    end
  end

	# Another idea: 
	#	For every Update:  make a hash "update_time" => [array of article URLs]
	# Each Article has many update times i.e. can appear on many lists throughout daily updates
	# Each Update has many articles i.e. list of 10 headlines/articles that represent "an update"
	
	#### End Feature notes: Update Tracker #####################