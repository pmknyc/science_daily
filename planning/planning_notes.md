  ## Updated: 04/20/2020
  
  This change log file was added to the repo to conform with typical Ruby gem structure. As of this update, however, I am not maintaining a changelog.


## Startup - 

# CLI class
*  Welcome to app
   *  Brief description of app
   *  Show most recent Update Time of headlines list.
   *  Show numbered list of Headlines - short article titles
   *  Show User choices:  
         * Choose number of article for details
         * Exit app
   
   *  'gets' user choice as input
      *  If Exit choice: display "goodbye" doc and ScienceDaily.com acknowledgment
      *  If Headline Number choice: 
         -  Display detailed info on chosen article
         -  article attributes:  :subtitle, :source, :abstract, :date_posted, :full_url

#  Scraper class
1st scrape: Scrape Top Science Latest Headlines page for article title and URL

2nd scrape: 
   At prompt, User chooses article for more info
   2nd scrape gets the chosen Article details: date posted, Source/Institution, abstract
      Get input number from CLI user choice methods
      
If user chooses article number:
* Scrape URL page of that article
* Get date_submitted

#  Article class: 
   #find_matching_article = match input number to Article.all array index 
   call article.URL as argument to 2nd scrape Scraper method
   Nokogiri opens 2nd scrape page using article's URL

