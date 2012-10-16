module AdobeConnect
	class Client
  		module User
  			# Provides a list of the accounts a user belongs to.
  			# @param options['login'] [String] [Required] The user’s login name, which may be the user’s e-mail address..
  			# @param options['password'] [String] [Required] Password of the user.
  			# @param options['session'] [String] [Optional] The value of the BREEZESESSION cookie.
      		# @return [Hash] HTTP return body
  			def user_accounts options = {}
  				options[:action] = 'user-accounts'
  				get( options )
  			end

  			# Overrides the score on an item within a curriculum.
  			# @param options['curriculum-id'] [String] [Optional] The ID of the curriculum.
  			# @param options['sco-id'] [Integer] [Required] The unique ID of a SCO with a score you want to override.
  			# @param options['status'] [String] [Required] A value showing the status of the user’s attempt to use this SCO. Allowed values are completed, incomplete, user-passed, user-failed, and not-attempted.
      		# @param options['score'] [Integer] [Required] An integer value that represents the score the user has attained on this SCO.
      		# @param options['principal-id'] [String] [Required] The ID of the user whose transcript will be overridden.
      		# @return [Hash] HTTP return body
  			def user_transcript_update options = {}
  				options[:action] = 'user-transcript-update'
  				get( options )
  			end

  			# Provides information about one principal, either a user or a group. You must specify a principal-id. To find the principal-id, call principal-list, using a filter if necessary to limit the response.
  			# @param options['principal-id'] [String] [Required] The ID of a user or group you want information about. You can get the ID by calling principal-list.
      		# @return [Hash] HTTP return body
  			def user_info options = {}
  				options[:action] = 'principal-info'
  				get( options )
  			end

  			# Provides a complete list of users and groups, including primary groups.
  			# @param options['group-id'] [String] [Optional] The ID of a group. Same as the principal-id of a principal that has a type value of group.
  			# @param options['filter-definition'] [String] [Optional] A filter to reduce the volume of the response. @see http://help.adobe.com/en_US/connect/9.0/webservices/WS5b3ccc516d4fbf351e63e3d11a171ddf77-7ffa_SP1.html
  			# @param options['sort-definition'] [String] [Optional] A sort to return results in a certain sequence. @see http://help.adobe.com/en_US/connect/9.0/webservices/WS5b3ccc516d4fbf351e63e3d11a171ddf77-7ff8_SP1.html
      		# @return [Hash] HTTP return body
  			def user_list options = {}
  				options[:action] ||= 'principal-list'
  				get( options )
  			end

  			# Find a user by email address.
  			# @param email [String] [Required] User's email address
      		# @return [Hash] HTTP return body
  			def user_by_email email
  				user_list({ 'filter-email' => email })
  			end

  			# Removes one or more principals, either users or groups. To delete principals, you must have Administrator privilege.
  			# @param options['principal-id'] [String] [Required] The ID of a user or group you want to delete.
      		# @return [Hash] HTTP return body
  			def user_delete options = {}
  				options[:action] = 'principals-delete'
  				get( options )
  			end

  			# Creates a principal (a user or group) or updates a standard field for a principal. The principal is created or updated in the same account as the user making the call.
  			# @param options['description'] [String] [Optional] The new group’s description. Use only when creating a new group..
  			# @param options['email'] [String] [Optional] The user’s e-mail address. Can be different from the login. Be sure to specify a value if you use send-email=true..
  			# @param options['first-name'] [String] [Optional] The user’s new first name. Use only with users, not with groups. Required to create a user..
  			# @param options['has-children'] [Boolean] [Required] Whether the principal has children. If the principal is a group, use 1 or true. If the principal is a user, use 0 or false. .
  			# @param options['last-name'] [String] [Optional] The new last name to assign to the user. Required to create a user. Do not use with groups..
  			# @param options['login'] [String] [Optional] The principal’s new login name, usually the principal’s e-mail address. Must be unique on the server. Required to create or update a user. Do not use with groups.
  			# @param options[name'] [String] [Optional] The new group’s name. Use only when creating a new group. Required to create a group.
  			# @param options['password'] [String] [Optional] The new user’s password. Use only when creating a new user.
  			# @param options['principal-id'] [String] [Optional] The ID of the principal that has information you want to update. Required to update a user or group, but do not use to create either.
  			# @param options['send-email'] [Boolean] [Optional] A flag indicating whether the server should send an e-mail to the principal with account and login information..
  			# @param options['type'] [String] [Optional] The type of principal. Use only when creating a new principal. @see http://help.adobe.com/en_US/connect/9.0/webservices/WS5b3ccc516d4fbf351e63e3d11a171ddf77-7f9c_SP1.html
      		# @return [Hash] HTTP return body
  			def user_update options = {}
  				options[:action] = 'principal-update'
  				options['has-children'] ||= 0
  				get( options )
  			end
  			alias :user_create :user_update
  		end
  	end
end