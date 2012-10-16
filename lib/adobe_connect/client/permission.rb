module AdobeConnect
	class Client
		module Permission
			# Returns the list of principals (users or groups) who have permissions to act on a SCO, principal, or account.
			# @param options['acl-id'] [String] [Required] The ID of a SCO, account, or principal that a principal has permission to act on. The acl-id is a sco-id, principal-id, or account-id in other calls.
      # @param options['principal-id'] [String] [Optional] The ID of a principal who has a permission (even if denied) to act on an object.
      # @param options['filter-definition'] [String] [Optional] A filter to reduce the volume of the response.
      # @param options['sort-definition'] [String] [Optional] A sort to return results in a certain sequence.
    	# @return [Hash] HTTP return body
			def permissions_info options = {}
				options[:action] = 'permissions-info'
				get( options )
			end

      # Resets all permissions any principals have on a SCO to the permissions of its parent SCO. If the parent has no permissions set, the child SCO will also have no permissions.
      # @param options['acl-id'] [String] [Required] The ID of a SCO that has permissions you want to reset.
      # @return [Hash] HTTP return body
      def permissions_reset options = {}
        options[:action] = 'permissions-reset'
        get( options )
      end

      # Updates the permissions a principal has to access a SCO, using a trio of principal-id, acl-id, and permission-id. To update permissions for multiple principals or objects, specify multiple trios. You can update more than 200 permissions in a single call to permissions-update.
      # @param options['acl-id'] [String] [Required] The ID of a SCO (a sco-id) for which you want to update permissions.
      # @param options['principal-id'] [String] [Required] The ID of a principal, either a user or group.
      # @param options['permission-id'] [String] [Required] The permission to assign (see http://help.adobe.com/en_US/connect/9.0/webservices/WS8d7bb3e8da6fb92f73b3823d121e63182fe-8000_SP1.html#WS5b3ccc516d4fbf351e63e3d11a171ddf77-7fe9_SP1 for values).
      # @return [Hash] HTTP return body
      def permissions_update options = {}
        options[:action] = 'permissions-update'
        get( options )
      end
  	end
  end
end