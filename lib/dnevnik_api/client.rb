module DnevnikApi
  class Client
    URL_PRODUCTION = 'https://api.dnevnik.ru/v1/'
    URL_DEBUG = 'https://api.staging.dnevnik.ru/v1/'

    def initialize(options)
      url = options[:debug] ? URL_DEBUG : URL_PRODUCTION
      @token = options[:token]
      @connection = intialize_connection(url)
    end

    def user(options = {})
      id = options.delete(:id) || 'me'

      get_request("users/#{id}", options.merge(id: id))
    end

    private

    def with_default_options(options)
      options.merge(access_token: @token)
    end

    def get_request(uri, options)
      @connection.get(uri, with_default_options(options)).body
    end

    def intialize_connection(url)
      Faraday.new(url, {}) do |builder|
        builder.request :oauth2, @token unless @token.nil?
        builder.request :url_encoded

        # builder.response :logger
        builder.response :mashify
        # builder.response :oj, preserve_raw: true
        builder.adapter  Faraday.default_adapter
      end
    end
  end
end