require 'faraday_middleware'

module AdobeConnect
  module Request
    @http_connection = nil

    def delete options = {}, full = false, raw = false, force_urlencoded = false
      request(:delete, options, full, raw, force_urlencoded)
    end

    def get options = {}, full = false, raw = false, force_urlencoded = false
      request(:get, options, full, raw, force_urlencoded)
    end

    def post options = {}, full = false, raw = false, force_urlencoded = false
      request(:post, options, full, raw, force_urlencoded)
    end

    def put options = {}, full = false, raw = false, force_urlencoded = false
      request(:put, options, full, raw, force_urlencoded)
    end

    private

    def request method, options, full, raw, force_urlencoded
      response = connection(raw, force_urlencoded).send(method) do |req|
        req.path = @url_path
        req.params ||= {}
        req.params.merge!( options )
        req.params[:session] = sessionId if authenticated?
      end

      if raw || full
        response
      else
        response.body
      end
    end

    def connection raw = false, force_urlencoded = false
      
      options = { :url => @url }

      options.merge!(:params => {:session => sessionId}) if authenticated?

      @http_connection ||= Faraday.new(options) do |conn|
        #conn.request :json

        conn.request :url_encoded if force_urlencoded
        conn.response :logger

        unless raw
          conn.response :xml,  :content_type => /\bxml$/
          conn.response :json, :content_type => /\bjson$/
        end

        conn.use :instrumentation
        conn.adapter Faraday.default_adapter

      end

      @http_connection
    end
  end
end
