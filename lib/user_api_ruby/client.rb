require 'oauth2'

module Sharesight
  class Client

    def initialize(site:, consumer_key:, consumer_secret:)
      @site = site
      @consumer_key = consumer_key
      @consumer_secret = consumer_secret
      @client = OAuth2::Client.new(consumer_key, consumer_secret, site: @site, path: '/oauth2')
    end

    def authorize(email, password)
      @token = @client.password.get_token(email, password)
    end

    def portfolios
      response = @token.get('/api/v2/portfolios.json')
      puts response.body
    end

  end
end
