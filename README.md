# Ttrakker

This gem is uesed to pull data from ( http://amtrak.com ).  It currently supports status queries.

## Installation

Add this line to your application's Gemfile:

    gem 'ttrakker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ttrakker

## Usage

User Ttrakker::Status.status_results to get an array of status results from ( http://amtrak.com ).
Use the functions in the Ttrakker::Status library to grab specific data from each.

## Contributing

1. Fork it ( https://github.com/Hawkeye000/ttrakker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
