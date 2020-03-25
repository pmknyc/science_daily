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

#  Later Features I want to add: 
   *  At startup: choose to see articles list in Date or Alphabetical order?
      - display list of 10 headlines in order chosen
   *  List Update - headlines are updated throughout day
      -  Ask user if want to check for newer Update Time to headlines list.
         Add to existing choices list: see List, check Update time, Exit
         -  If Yes, check update:
            scrape 1st page's Update Time (to display)
            scrape 1st page's Headlines list (to compare URLs for new articles since last update)
            show user the new update time headlines list, and FLAG which articles are new to list
