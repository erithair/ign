# IGN

Scrape game info from [IGN](http://www.ign.com).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ign', git: 'https://github.com/erithair/ign.git'
```

And then execute:

    $ bundle

## Usage

```ruby
games = IGN::Game.search('GTA5')
game = games.first

game.name # => "Grand Theft Auto V"
game.rating # => 10.0
game.platforms # => ["PS3", "Xbox 360", "PS4", "Xbox One", "PC"]
```

### Attributes of Game

* name
* id(will be used in further dev)
* rating
* handle(will be used in further dev)
* platforms
* publisher
* release_date
* thumb
* description


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/erithair/ign. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
