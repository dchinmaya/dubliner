# Dubliner

Dubliner is a tool for filtering invitees based on their geo-location for a party at a location in Dublin
(GPS coordinates 53.3381985, -6.2592576).

Dubliner read a full list of customers and outputs the names and user ids of customers within 100 km,
sorted by user id. It requires a json encoded list of customers as input.
Dubliner is available as a gem in [rubygems.org](https://rubygems.org/gems/dubliner)

## Installation

ruby and gems are required to install and run dubliner

Install the gem using the below command:

    $ gem install dubliner

## Usage

After installation, run
```
dubliner <path-to-json-encoded-customer-list>
```
to get a list of customers eligible for the party.

## Testing

run `rake` or `rspec` to execute a slew of unit tests

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dchinmaya/dubliner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

