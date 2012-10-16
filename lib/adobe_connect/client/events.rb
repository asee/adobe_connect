module AdobeConnect
	class Client
  		module Events
  			# This action registers a new or an existing user for an event.
  			# @param options['sco_id'] [String] Sco ID of the Event.
  			# @param options['login'] [String] User login of the user.
  			# @param options['password'] [String] Password of the user.
  			# @param options['password-verify'] [String] Re-type password for confirmation.
  			# @param options['first-name'] [String] First name of the user.
     		# @param options['last-name'] [String] Last name of the user.
     		# @param options['campaign-id'] [String] The campaign ID of the campaign [Optional].
      		# @return [Hash] HTTP return body
  			def event_register options = {}
  				options[:action] = 'event-register'
  				get( options )
  			end

  			# Given a user’s login or principal-id, this action returns the list of events that the user attended. If an account-id is not provided, the currently active login account is used. If principal-id is not provided, the currently active principal is used.
  			# @param options['principal-id'] [String] The list of the events attended by the user whose ID is specified here.
  			# @param options['login'] [String] The list of the events attended by the user whose login is specified here.
  			# @param options['account-id'] [String] The account ID to which the user belongs whose attended events are to be listed.
      		# @return [Hash] HTTP return body
  			def events_attendance options = {}
  				options[:action] = 'events-attendance'
  				get( options )
  			end
  		end
  	end
end