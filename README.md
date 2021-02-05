# Birdbrain-Ruby-Library

Ruby Library for the BirdBrainTechnologies Hummingbird Bit and Finch 2

This Ruby library allows students to use Ruby to read sensors and set motors and LEDs with the Hummingbird Bit. To use Ruby with the Hummingbird Bit, you must connect to the Hummingbird Bit via bluetooth with the BlueBird Connector.

For more information about setting up the BlueBird Connector used with their Python library, see www.birdbraintechnologies.com/hummingbirdbit/python

Rdoc files are available at https://rdoc.info/github/fmorton/BirdBrain-Ruby-Library

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'birdbrain'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install birdbrain

The library is distributed through https://rubygems.org/gems/birdbrain

## Usage

Below are two examples causing a Finch 2 to move in the path of a box. The first example is the long way to do it:

```ruby
require 'birdbrain'

finch = BirdbrainFinch.connect('A')

finch.beak(0, 50, 0)

finch.tail(1, 0, 50, 0)
finch.move(BirdbrainFinch::FORWARD, 2, 20)
finch.turn(BirdbrainFinch::LEFT, 90, 50)

finch.tail(2, 0, 50, 0)
finch.move(BirdbrainFinch::FORWARD, 2, 20)
finch.turn(BirdbrainFinch::RIGHT, 90, 50)
finch.tail(3, 0, 50, 0)

finch.move(BirdbrainFinch::BACKWARD, 2, 20)
finch.turn(BirdbrainFinch::RIGHT, 90, 50)
finch.tail(4, 0, 50, 0)

finch.move(BirdbrainFinch::FORWARD, 2, 20)
finch.turn(BirdbrainFinch::LEFT, 90, 50)
sleep(1)

finch.disconnect
```

The second way has the same result, but is more concise:

```ruby
require 'birdbrain'

def draw(finch, step, move_direction, turn_direction)
  finch.tail(step, 0, 50, 0)
  finch.move(move_direction, 2, 20)
  finch.turn(turn_direction, 90, 50)
end

finch = BirdbrainFinch.connect('A')

finch.beak(0, 50, 0)

draw(finch, 1, BirdbrainFinch::FORWARD, BirdbrainFinch::LEFT)
draw(finch, 2, BirdbrainFinch::FORWARD, BirdbrainFinch::RIGHT)
draw(finch, 3, BirdbrainFinch::BACKWARD, BirdbrainFinch::RIGHT)
draw(finch, 4, BirdbrainFinch::FORWARD, BirdbrainFinch::LEFT)
sleep(1)

finch.disconnect
```

Rdoc files are available at https://rdoc.info/github/fmorton/BirdBrain-Ruby-Library

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fmorton/BirdBrain-Ruby-Library.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
