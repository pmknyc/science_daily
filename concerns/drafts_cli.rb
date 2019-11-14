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
		
   