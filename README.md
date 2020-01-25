# Activerecord::PatternMatch

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-pattern_match'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install activerecord-pattern_match

## Usage

```ruby
require "activerecord/pattern_match"

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string  :name
    t.integer :age

    t.timestamps
  end
end

class User < ActiveRecord::Base
end

using ActiveRecord::PatternMatch

user = User.create name: "homu", age: 14

user in { name:, age: }
p name
p age
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/activerecord-pattern_match.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
