# Chilexpress Rails Gem

Simple to use rails gem for get Chilexpress order's information

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chilexpress_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chilexpress_rails

## Usage

```ruby
# you must provide a valid Chilexpress order code
my_tracking_code = '<some_chilexpress_tracking_number>'

order = ChilexpressRails.search_order(my_tracking_code)

# after that, you can take a look on values
puts order.track_number
puts order.product
puts order.service
puts order.status
puts order.receiver_name
puts order.receiver
puts order.datetime
```

## References

This is a brand new updated gem that taking some (great part) of holamendis's gem (https://github.com/holamendi/chilexpress). That was a good starting point to do this.

## Contributing

1. Fork it ( https://github.com/zetahawke/chilexpress_rails/fork )
2. Create your feature branch (`git checkout -b my-local-branch`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-local-branch`)
5. Create a new Pull Request
