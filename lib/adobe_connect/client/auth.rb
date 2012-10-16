module AdobeConnect
	class Client
  		module Auth
  			
  			def login options = {}
  				options = default_client_options.merge( options )
  				options[:action] = 'login'

  				response = get( options, true )

  				raise AdobeConnect::Errors::GeneralError, "This login request was unsuccessful" if response.status != 200 || !response.success?
  				raise AdobeConnect::Errors::AuthenticationError, "The login and password supplied is invalid" if  !response.body['results'] || !response.body['results']['status'] || response.body['results']['status']['code'].downcase != 'ok' 

  				set_session_from_cookie response.headers['set-cookie']
  				
  				response
  			end

  			def logout options = {}
  				options[:action] = 'logout'

  				response = get( options )
  				@sessionId = nil

  				response
  			end

  			def authentication
		      	{ :login => username, :password => password }
		    end

		    private
		    def set_session_from_cookie cookies
		    	raise AdobeConnect::Errors::InvalidCookie, 'Cookie string was empty' unless cookies
		    	
		    	@cookieData ||= {}

		    	cookies.split(';').each do |c|
			      	cookie_data = c.split("=")
			      	@cookieData[ cookie_data[0] ] = cookie_data[1]
			      	if cookie_data[0] == "BREEZESESSION"
			        	self.sessionId = cookie_data[1]
			      	end
			      	if cookie_data[0] == "domain"
			        	self.cookieDomain = cookie_data[1]
			      	end
			      	
			    end

			    raise AdobeConnect::Errors::CookieNotFound, "BREEZESESSION value not found in cookie" unless authenticated?
		    end

  			def default_client_options
  				opts = authentication

  				opts[:"account-id"] 	= self.account 		 if self.account
  				opts[:"external-auth"] 	= self.external_auth if self.external_auth
  				opts[:"domain"] 		= self.domain 		 if self.domain

  				opts
  			end

  			def authenticated?
      			!self.sessionId.blank?
    		end
  		end
  	end
end