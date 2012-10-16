require 'faraday'
require 'adobe_connect/configuration'
require 'adobe_connect/client'
#require 'adobe_connect/errors'
#require 'adobe_connect/version'

module AdobeConnect
  extend Configuration

  class << self
    def new(options={})
      AdobeConnect::Client.new(options)
    end

    # Delegate to AdobeConnect::Client.new
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end

  autoload :Errors, "adobe_connect/errors"
  autoload :Version, "adobe_connect/version"
end