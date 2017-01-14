# AozoraSsml
[![Build Status](https://travis-ci.org/hogelog/aozora-ssml.svg?branch=master)](https://travis-ci.org/hogelog/aozora-ssml)
[![Gem Version](https://badge.fury.io/rb/aozora-ssml.svg)](http://badge.fury.io/rb/aozora-ssml)


Aozora Bunko XHTML to SSML converter.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aozora-ssml'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aozora-ssml
    
## Usage

```ruby
AozoraSsml.html2ssml(html) # => ssml string
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hogelog/aozora-ssml.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

