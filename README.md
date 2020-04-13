# ScienceDaily

A CLI application that lets you quickly check 10 Top Science News headlines and a summary of each, similar to an RSS feed.

# Installation

This was built in Ruby 2.6.1. 
To install and run the application, you will need a local installation of Ruby. 

Fork the repo and clone to your local machine.

Then execute:

    $ bundle

to install required gems and dependencies.

Start the application at a terminal prompt:

    $ bin/sdnews

## Usage

After starting the app, you will see a list of 10 science headlines.

Choose the number of the headline that interests you to see details about the article.

Details about each article include:

    1. The university or institution that conducted the research.
    2. The date this article was posted at the ScienceDaily.com site.
    3. A brief summary of the article to peak your interest to know more!
    4. The URL of the full article so you can read it in a browser.

The top science headlines are updated throughout the day! 

Each time you run the application, it pulls the most current list of headlines so you can stay up-to-date on science news!

Data are sourced from ScienceDaily.com, which posts news based on primary source journal articles or press releases from the scientists and institutions who conducted the research.

Thanks for your interest! I hope you enjoy using this app.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pmknyc/science_daily. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it ( https://github.com/pmknyc/science_daily)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## License

This app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ScienceDaily project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/science_daily/blob/master/CODE_OF_CONDUCT.md).
