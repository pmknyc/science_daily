# frozen_string_literal: true

class ScienceDaily::CLI

  attr_accessor :choices, :current_choice

  @@choices = []
	@@current_choice = -1
	    
  def self.start
  p "in CLI.start method"
    create_articles #headlines list: scrape & create objects
    list_update_time #headlines list most recent update
    start_doc # Welcome message
    list_articles 
		main_app_loop
	end 

  def self.main_app_loop
    p 'in CLI#main_app_loop method'
    input = ""
    
    until input == "e"
      input = gets.strip.downcase
      goodbye = "e".eql?(input)
      list = "l".eql?(input)
      digit = (1..10).include?(input.to_i) 
      case      
        when goodbye
          goodbye_doc
        when list
#          system "clear"
		  		list_articles
        when digit 
          choice = input.to_i - 1
          @@choices << choice
          @@current_choice = choice 
          add_article_features # calls Article.add_article_features
        else
          puts "I don't understand that. Please try again."
          main_app_loop # recurse until valid choice
      end
    end
  end

  def self.choices
    @@choices # keeps history of all article choices
  end

  def self.current_choice
    @@current_choice
  end

  ####  1ST LEVEL DATA - HEADLINES LIST ####
    
  def self.create_articles
  p "in CLI.create_articles method"
    ScienceDaily::Article.create_articles # 1st scrape, make article objects   
  end

  def self.list_update_time
    ScienceDaily::Article.topsci_headlines_latest_update
  end

  def self.list_articles
  	p "in CLI.list_articles method"
        # now iterate all article objects to display list for user
    ScienceDaily::Article.list_articles 
  end
  #### END 1ST LEVEL - list articles METHODS ####
  
  #### 2nd LEVEL DATA - add individual article attributes & display ####
    def self.add_article_features
      #article = ScienceDaily::Article.all[current_choice]  
      ScienceDaily::Article.add_article_features
      display_article
    end 
  #### END 2ND LEVEL DATA     #####

      # HEREDOCS SECTION: user interaction messages
        # ?? TODO: 1. using HEREDOC with tick marks <<-'HEREDOC' - how that helps with alignment
        #             make Headlines Updated line INDENT! it's flush left
  
  def self.start_doc
#    system "clear"
      puts <<-'WELCOME'

                      Welcome to Science Daily News

               Breaking news in science from around the world!
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      WELCOME
   # ?? Add "type L for list" feature when figure out main loop problem
   #  Type the letter "L" for a list of the latest, top science headlines.
  end
      
  def self.choose_or_exit_doc
    puts <<-'CHOICE'
      
      To learn more about a headline, type its number then press <Enter>
      To exit the application, enter "e"

      What would you like to do?
      CHOICE
  end

  def self.display_article
    p "in CLI #display_article"
    article = ScienceDaily::Article.all[current_choice]
#    system "clear"
    puts <<~ARTICLE
          
          Title:    #{article.subtitle}     
          Posted:   #{article.date_posted}
          Source:   #{article.source}

          Abstract:             
          #{article.abstract}

          Full article: "#{article.full_url}"

    ARTICLE
    # try this to make border over/under article text #{80.times do '~' end}
    cite_source_doc
  end

  def self.choose_again_doc
    puts <<~ANOTHER

      Hey, scientists figure out cool stuff!

      Want to see another article? Enter letter "l"
      Ready to exit the app? Enter "e" or "exit"
    
      ANOTHER
  end
      
  def self.cite_source_doc
    puts <<~CITE
      
      Acknowledgment:
      Content is sourced from https://sciencedaily.com
      and complies with that site's permissions for use.
      We ask you also to abide by Science Daily's terms of use, found here:
      https://www.sciencedaily.com/terms.htm

      CITE
    sleep(5)
    choose_again_doc
  end

  def self.goodbye_doc
    puts <<~BYE
      
    **** Thank you! We hope you found something fascinating! ****
    
              Headlines are updated many times a day 
                Please come again to see the latest 
                science FACTS instead of FAKE NEWS!
    
    *************************************************************

		BYE
		sleep(5)
  end
end # class CLI end