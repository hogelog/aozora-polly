# AozoraPolly
[![Build Status](https://travis-ci.org/hogelog/aozora-polly.svg?branch=master)](https://travis-ci.org/hogelog/aozora-polly)
[![Gem Version](https://badge.fury.io/rb/aozora-polly.svg)](http://badge.fury.io/rb/aozora-polly)


Aozora Bunko XHTML to mp3 converter powered by [Amazon Polly](https://aws.amazon.com/polly/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aozora-polly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aozora-polly
    
## Usage

```ruby
AozoraPolly.html2ssml(html) # => ssml string
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hogelog/aozora-polly.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

