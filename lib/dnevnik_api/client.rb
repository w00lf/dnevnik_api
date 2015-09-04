module DnevnikApi
  class Client

    attr_accessor :token

    def initialize(options)
      @token = options[:token]
      @configuration = DnevnikApi.configuration
      url = @configuration.api_url_base
      @connection = intialize_connection(url)
    end

    def access_token(code)
      client_secret = @configuration.client_secret
      client_id = @configuration.client_id
      post_request("authorizations",
                   { code: code,
                     client_secret: client_secret,
                     client_id: client_id })
    end

    def user(options = {})
      user_meta(options)
    end

    def user_schools(options = {})
      user_meta(options, 'schools')
    end

    def user_edu_groups(options = {})
      user_meta(options, 'edu-groups')
    end

    private

    def user_meta(options, additional_uri = '')
      id = options.delete(:id) || 'me'
      get_request("users/#{id}/#{additional_uri}", options.merge(id: id))
    end

    def with_default_options(options)
      options.merge(access_token: @token)
    end

    def get_request(uri, options)
      JSON.parse(@connection.get(uri, with_default_options(options)).body)
    end

    def post_request(uri, options)
      JSON.parse(@connection.post(uri, with_default_options(options)).body)
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