module AdobeConnect
	class Client
  		module Info
  			# Returns basic information about the current user and the Adobe Connect server or Adobe Connect hosted account.
  			# @param options['domain'] [String] A domain name identifying a Adobe Connect hosted account.
      		# @return [Hash] HTTP return body
  			def common_info options = {}
  				options[:domain] ||= self.domain if self.domain
  				options[:action] = 'common-info'
  				get( options )
  			end
  		end
  	end
end