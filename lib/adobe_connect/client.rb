require 'adobe_connect/errors'
require 'adobe_connect/request'
require 'adobe_connect/client/auth'
require 'adobe_connect/client/events'
require 'adobe_connect/client/info'
require 'adobe_connect/client/permission'
require 'adobe_connect/client/reports'
require 'adobe_connect/client/sco'
require 'adobe_connect/client/user'

module AdobeConnect
  class Client
  	attr_accessor(*Configuration::VALID_OPTIONS_KEYS)
  	attr_accessor :sessionId
  	attr_accessor :cookieDomain

  	def getCookieData
  		@cookieData
  	end
  	
    def initialize(options={})
      options = AdobeConnect.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end

      login unless options[:auto_login]
    end

    include AdobeConnect::Request

    include AdobeConnect::Client::Auth
    include AdobeConnect::Client::Events
    include AdobeConnect::Client::Info
    include AdobeConnect::Client::Permission
    include AdobeConnect::Client::Reports
    include AdobeConnect::Client::Sco
    include AdobeConnect::Client::User

  end
end