# UX plan:

## Startup - 
   1. Welcome message
   2. Brief description of app
   3. Presents user a list of all Top Science headlines (titles)
     Bonus: ?? show user Date+Time headline list last updated (Add to scrape)
     Bonus:  ?? user option to order headline list 
             in alpha by title or date order newest 1st 

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

   Call CLI.new using diff method in sd_run file
   this method does not show startup Welcome msg
   it shows msg about "Updating headlines list"

## If user chooses EXIT

   Prompt "are you sure you want to exit?"  
   If Y, then exit.  If N, then return to prior screem before user typed exit
