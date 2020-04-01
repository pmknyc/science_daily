# start method in CLI
  p "in CLI.start method"
		create_articles Article. 
		initial_update_time
    start_doc # Welcome message
    list_articles # call methods: scrape,create article objects, display objects' titles
		choose_or_exit_doc
	  user_chooses # list headlines, article number or exit  
    display_article # calls Article.add_article_features
    cite_source_doc
		choose_again_doc #ask user if want to see list again
		user_chooses
		
	 
		3/31/20

		def self.choose_or_exit_doc
			p 'CLI.choose_or_exit_doc'
	
			puts <<~CHOICE
				
							To #{'learn more'.colorize(:light_blue)}, enter the headline #{'number'.colorize(:light_blue)}
							To #{'exit'.colorize(:light_blue)} the application, enter #{'"e"'.colorize(:light_blue)}
	
							What would you like to do?
			
				CHOICE
		end
	
		