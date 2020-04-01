# Start-up command:
  $  bin/sdnews

## Read environment configs 
lib/science_daily.rb: 

## Call first method
bin/sdnews calls:
  * CLI.start 

CLI.create_articles
Article.create_articles
Scraper.articles_list        

CLI.list_update_time
Article.topsci_headlines_latest_update
Scraper.topsci_headlines_update

CLI.start_doc
<show Welcome message>

CLI.list_articles

<show headlines update time>

<show headlines numbered list>

CLI.choose_or_exit_doc

<show Choice message: choose a headline or exit>
DECISION POINT
User Input

## Main app loop
CLI.main_app_loop	
num choice - CLI.main_app_loop
CLI.add_article_features
Article.add_article_features
Article.chosen_article - gets CLI.current_choice
CLI.current_choice
Scraper.article_features
CLI.display_article
CLI.current_choice

<show chosen article details>

CLI.cite_source_doc

<show scraped source site Acknowledgment message>

CLI.choose_again_doc

<show message with options:
 to see another article (really to see headlines list) 
 or exit>
DECISION POINT
User Input

If input is 'l' (list):
<show headlines numbered list>

If choice is exit:
CLI.goodbye_doc
<show closing message>
app exits after 5 seconds
