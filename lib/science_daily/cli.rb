# frozen_string_literal: true

class ScienceDaily::CLI

  attr_accessor :choices, :current_choice

  @@choices = []
	@@current_choice = -1
	    
  def self.start
  p "in CLI.start method"
    create_articles #scrape headlines list & create objects
    list_update_time #headlines list most recent update
    start_doc # Welcome message
    list_articles 
		main_app_loop
	end 

  def self.main_app_loop
    p 'CLI.main_app_loop '
    input = ""
    
    until input == "e"
      input = gets.strip.downcase
      goodbye = "e".eql?(input)
      list = "l".eql?(input)
      num = (1..10).include?(input.to_i) 
      case      
        when goodbye
          goodbye_doc
        when list
#          system "clear"
		  		list_articles
        when num 
          p 'num choice - CLI.main_app_loop'
          choice = input.to_i - 1
          @@choices << choice
          @@current_choice = choice 
        # binding.pry
          add_article_features # for chosen article
        else
          p 'invalid choice - CLI.main_app_loop'
          puts "\nI don't understand that. Please try again.\n"
          main_app_loop # recurse until valid choice
      end
    end
  end

  def self.choices
  p 'CLI.choices'
    @@choices #article choices history in this session
  end

  def self.current_choice
  p 'CLI.current_choice'  
    @@current_choice
  end

  ####  1ST LEVEL DATA - HEADLINES LIST ####
    
  def self.create_articles
  p "in CLI.create_articles method"
    ScienceDaily::Article.create_articles # 1st scrape
  end

  def self.list_update_time
  p 'CLI.list_update_time'
    ScienceDaily::Article.topsci_headlines_latest_update
  end

  def self.list_articles
  p 'CLI.list_articles method'
    ScienceDaily::Article.list_articles

  end
  #### END 1ST LEVEL - Headlines list ####
  
  #### 2nd LEVEL DATA - individual article features when chosen  ####
  def self.add_article_features
  p 'CLI.add_article_features'
    ScienceDaily::Article.add_article_features
    display_article
  end 
  #### END 2ND LEVEL DATA     #####

      # HEREDOCS SECTION: user interaction messages
        # ?? TODO: 1. using HEREDOC with tick marks <<-'HEREDOC' - how that helps with alignment
        #             make Headlines Updated line INDENT! it's flush left
  
  def self.start_doc
    p 'CLI.start_doc'
    system "clear"
      puts <<~WELCOME

          #{'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.colorize(:light_blue)}

                          #{'Welcome to Science Daily News'.colorize(:white)}

                 #{'Breaking news in science from around the world!'.colorize(:white)}

          #{'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.colorize(:light_blue)}

      WELCOME
  end
      
  def self.choose_or_exit_doc
    p 'CLI.choose_or_exit_doc'

    puts <<~CHOICE
      
            To #{'learn more'.colorize(:light_blue)}, enter the headline #{'number'.colorize(:light_blue)}
            To #{'exit'.colorize(:light_blue)} the application, enter #{'"e"'.colorize(:light_blue)}

            What would you like to do?
    
      CHOICE
  end

  def self.display_article
    p "CLI.display_article"
    article = ScienceDaily::Article.all[current_choice]
      system "clear"
        puts <<~ARTICLE

              #{"Title:".colorize(:light_blue)}
              #{article.subtitle.colorize(:light_yellow)}

              #{"Posted:".colorize(:light_blue)}  #{article.date_posted.colorize(:light_yellow)}
              #{"Source:".colorize(:light_blue)}  #{article.source.colorize(:light_yellow)}

              #{"Abstract:".colorize(:light_blue)}
              #{article.abstract.colorize(:light_yellow).wrap_to_limit(65)}

              #{"Full article:".colorize(:light_blue)}
              #{article.full_url.colorize(:light_yellow)}

        ARTICLE
    cite_source_doc
  end

  def self.choose_again_doc
    p 'CLI.choose_again_doc'
    puts <<~ANOTHER

            #{'Hey, scientists figure out cool stuff!'.colorize(:magenta)}

            Want to see #{'another'.colorize(:light_blue)} article?  Enter letter #{'"l"'.colorize(:light_blue)}
            Ready to #{'exit'.colorize(:light_blue)} the app?        Enter #{'"e"'.colorize(:light_blue)}

            ANOTHER
  end
      
  def self.cite_source_doc
    p 'CLI.cite_source_doc'
    puts <<~CITE
      
            #{'Acknowledgment:'.colorize(:light_blue)}
            Content is sourced from https://sciencedaily.com
            and complies with that site's permissions for use.
            We ask you also to abide by Science Daily's terms of use, found here:
            https://www.sciencedaily.com/terms.htm

      CITE
    sleep(5)
    choose_again_doc
  end

  def self.goodbye_doc
    p 'CLI.goodbye_doc'
    puts <<~BYE

            ~~~~ #{'Thank you!  We hope you found something fascinating!'.colorize(:magenta)} ~~~~
    
                       Headlines updated many times daily
                       Please come again to see the latest 
                       science FACTS instead of FAKE NEWS!
    
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	    	BYE
      sleep(5)
    exit
  end
end # class CLI end