# DnevnikApi

Ruby wrapper around Dnevnik API - https://api.dnevnik.ru/, supports simple api call, uses faraday for requests

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dnevnik_api'
```

To use gem you need to configurate it:

```ruby
DnevnikApi.configure do |config|
    config.client_id = "Your dnevnik api id"
    config.client_secret = "Your dnevnik api secret"
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dnevnik_api

## Usage

token
```ruby
client = DnevnikApi::Client.new(token: your_access_token)
# Get user information(https://api.dnevnik.ru/#Users)
client.user(id: user_id)

# Get user schools list(https://api.dnevnik.ru/#EducationMemberships)
client.user_schools(id: user_id)

# Get user education groups (https://api.dnevnik.ru/#EducationMemberships)
client.user_edu_groups(id: user_id)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dnevnik_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
