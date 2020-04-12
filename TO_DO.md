3/29/20:

* DONE Article object not displaying suddenly! Fix

* 'Clear' commands
    DONE uncomment these when finalizing app; turned them off so can see console output of method calls

* p commands to log process flow:  
    DONE either delete them or make a git branch to store copy of app with all those p commands showing

* Heredocs:
    DONE  clean up alignment


*  UX issues: make prettier
    DONE  Color the text: colorize or pastel gem: read about these and pick one!
    
    DONE  Article details DISPLAY: control line wrapping so more readable,especially article.abstract
          - found wrapify gem and got it to work!
            Usage: https://www.rubydoc.info/gems/wrapify/0.1.2
            For a given string, mystring, invoke the string method, wrap_to_string, with a wraplimit.
            ```mystring.wrap_to_limit(20)
            ```
    DONE Exit command - add it back in

*  Startup delay - try to fix
    DONE  String literals to change to String.new, make faster
          DONE  in main loop for input
    DONE  make Welcome Message 1st in start method, 
    DONE add info explaining to user that app may take a few seconds

