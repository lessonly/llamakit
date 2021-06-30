# Llamakit

Library containing common code needed to create lessonly apps.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'llamakit'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install llamakit

## Usage

This gem has fully compliant [YARD](https://yardoc.org/) documentation! Check it out by cloning the repo
then running `$ yard server --reload` in the top level directory. Here is a list of some things this gem
can do:

### Create a [Demux](https://github.com/lessonly/demux) record from a rack request:
```ruby
request = get_request_somehow()
signal = Llamakit::Signal.from_request request
signal.name #=> "lesson_available"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lessonly/llamakit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/llamakit/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Llamakit project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/llamakit/blob/master/CODE_OF_CONDUCT.md).
