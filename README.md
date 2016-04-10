# Password Generator

A password generator to help build passwords that meet complexity requirements from most websites.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'password-generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install password-generator

## Usage

You can require this library, and start generating passwords like so:

```ruby
require 'password-generator'
passwords = PasswordGenerator::PassGen.new()
puts passwords.generate(20)   # 20 Char Password
```

By default, this will use a character set as defined below:

```
abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
0123456789
!"#$%&'()*+,-./:;<=>?@[]^_`{}~|
```

This results in a password with lowercase letters, uppercase letters, numbers, and symbols, and it guarantees that at least one of each type of lowercase, uppercase, number, and symbol will be included.

You can pass an array into the PasswordGenerator::PassGen constructor to use an alternative set of chars:

```ruby
require 'password-generator'
set = ['abcdefghijklmnopqrstuvwxyz']
passwords = PasswordGenerator::PassGen.new(set)
puts passwords.generate(20)   # 20 Char Password of only lower case letters
```

This allows you to customize how passwords are generated, and each new array element is guaranteed to be used once, which makes ensuring generated passwords match password policies much easier.

## Synopsis

This gem also includes a command line client to generate passwords on the command line:

```
$ passgen -h
Usage: passgen [options] length
    -f, --file                       Character set file
```

By default, the CLI tool will look for a character set file in the following places:

- `$HOME/.passgen`
- The -f option, defaults to `./.passgen`

This allows you to have a personal password policy used by default, a project/folder level to be used for different sites, and a file override. The locations above are checked in this order, and the last one specified takes precedence.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mlrobinson/password-generator.
