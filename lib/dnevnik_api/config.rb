module DnevnikApi
  class << self
    attr_accessor :_configuration
  end

  def self.configuration
    self._configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    attr_accessor :client_id, :client_secret, :oauth_url, :api_url_base, :oauth_url_base

    def initialize
      @api_url_base = 'https://api.dnevnik.ru/v1/'
      @oauth_url_base = "https://login.dnevnik.ru/oauth2"
    end

    def oauth_url(redirect_uri, scope = ['FullName', 'Birthday'], response_type = "code")
      "#{oauth_url_base}?client_id=#{client_id}&client_secret=#{client_secret}&response_type=#{response_type}&scope=#{scope.join(',')}&redirect_uri=#{redirect_uri}"
    end
  end
end