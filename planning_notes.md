# UX plan:

## Startup - 
   Welcome message
   Brief description of app
   Presents user a list of all Top Science headlines (titles)
     Bonus: ?? also shows user Date headlines updated (must Add to scrape)
     Bonus:  ?? user option to order headline list 
             in alpha by title or date order newest 1st 

## Startup User Options
   Get user INPUT for these Choices:
   1.  See numbered list of headlines
         Later??: instead of numbered list, 
                   user enters 1st 3 to 5 chars in title (fun to code this)
   2.  Start again - in case headlines have updated
   3.  Exit app

 
## If User Chooses LIST

   Call Scraper.new to run 1st level scrape
## If User chooses AGAIN
   Call CLI.new using diff method in sd_run file
   this method does not show startup Welcome msg
   it shows msg about "Updating headlines list"
## If user chooses EXIT
   Prompt "are you sure you want to exit?"  
   If Y, then exit.  If N, then return to prior screem before user typed exit
