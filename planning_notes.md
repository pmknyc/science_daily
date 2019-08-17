# UX plan:

## Startup - 
# CLI     Display user messages
   1. Welcome to app
   2. Brief description of app
   3. Requests and collects User choices 
      a. at start, ask user to choose article number to see more info OR exit app
      b. 'gets' user input 
   Bonus: ?? show user Date+Time headline list was last updated (Add to scrape)

# Scraper 
1st scrape: Scrape Top Science page for article title and URL

2nd scrape: 
CLI:  User chooses article for more info
      Get input number from CLI user choice methods

Article: 
      #find_matching_article = match input number to Article.all array index 
      call article.URL for matching article as argument to 2nd scrape Scraper method
in Article: find Article object matching chosen article's URL
Nokogiri opens page using article's URL


# CLI
Display numbered list of Latest Headlines - article titles
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
