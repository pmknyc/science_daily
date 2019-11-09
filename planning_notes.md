# UX plan:

## Startup - 
# CLI     Display user messages
   *  Welcome to app
   *  Brief description of app
   *  Show "update time" of headlines list.
   *  Request and collect User choices 
   *  Choice 1: see articles list in Date or Alphabetical order?
      * display list of 10 headlines in order chosen
   *  Choice 2:   headline number to see more info on article OR
                  choose to Exit app.
   *  'gets' user choice as input
      *  If Exit choice: display "goodbye" doc and ScienceDaily.com acknowledgment
      *  If Headline Number choice: Display detailed info on chosen article
      
      b. article attributes:  :subtitle, :source, :abstract, :date_posted, :full_url

# Scraper 
1st scrape: Scrape Top Science Latest Headlines page for article title and URL

2nd scrape: 
CLI:  User chooses article for more info
      Get input number from CLI user choice methods

Article: 
      #find_matching_article = match input number to Article.all array index 
      call article.URL for matching article as argument to 2nd scrape Scraper method
in Article: find Article object matching chosen article's URL
Nokogiri opens page using article's URL


# CLI
Displays numbered list of Latest Headlines - article titles
Order as loaded in scrape (NOT date ordered on SD site)
* Bonus:  ?? user option to order headline list in alpha by title or date order newest 1st. (may require inner page scrape to do this, not within project requirements)

# CLI     
Display & get user choices - article number OR exit

# Scraper
If user chooses article number:
* Scrape URL page of that article
* Get date_submitted


## Startup User Options

   Get user INPUT for these Choices:

   1. See headlines in alpha or date order?
        Date: code pulls date from URL of article details (in 1st scrape)
   2. Update - in case headlines have updated -- 
        code challenge: the new Scrape checks for new article URLs as compared 
        with array collected when user first ran the app
   3. Exit app

 
## If User Chooses LIST

   Call Scraper.new to run 1st level scrape.


## If User chooses UPDATE

   Call CLI.new using different method in executable file
   this method does not show startup Welcome msg
   it shows msg about "Updating headlines list"

## If user chooses EXIT

   Prompt:
    "Thanks for using Science Daily News! Goodbye!" 
   If Y, then exit.  If N, then return to prior screem before user typed exit


 # User chooses article for more info:
  #  get input from CLI#create_user_choice
  #  convert input to index of an article object in Article.all array
  #  get that article's article.url attrib & interpolate it onto SITE URL
  #     to define the scrape site
  # an Article method that calls this scrape method to read features &
  # assign as instance vars/attributes