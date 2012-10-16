module AdobeConnect
  module Configuration
    VALID_OPTIONS_KEYS = [
      :url,
      :url_path,
      :username,
      :password,
      :account,  # account_id
      :external_auth, # => True/false
      :domain #
      ].freeze

    attr_accessor(*VALID_OPTIONS_KEYS)
    
    DEFAULT_URL = 'https://example.com'
    DEFAULT_URL_PATH = '/api/xml'

    def self.extended(base)
      base.default_config
    end

    # config/initializers/adobe_connect.rb (for instance)
    #
    # AdobeConnect.configure do |config|
    #   config.url = 'https://example.com'
    #   config.url_path = '/api/xml'
    # end
    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def url=(value)
      @url = File.join(value, "")
    end

    def default_config
      self.url = DEFAULT_URL
      self.url_path = DEFAULT_URL_PATH
    end
  end
end
