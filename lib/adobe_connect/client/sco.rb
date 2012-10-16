module AdobeConnect
	class Client
  		module Sco
  			# Returns information about a SCO at a specified URL path. 
  			# @param options['url-path'] [String] [Required] The unique identifier after the domain name in the URL to the SCO.
      		# @return [Hash] HTTP return body
  			def sco_by_url options = {}
  				options[:action] = 'sco-by-url'
  				get( options )
  			end

  			# Returns a list of SCOs within another SCO. The enclosing SCO can be a folder, meeting, or curriculum.
  			# @param options['sco-id'] [String] [Required] The unique ID of a folder for which you want to list contents. You can get the sco-id by calling sco-shortcuts.
  			# @param options['filter-definition'] [String] [Optional] A filter to reduce the volume of the response.
  			# @param options['sort-definition'] [String] [Required] A sort to return results in a certain sequence.
      		# @return [Hash] HTTP return body
  			def sco_contents options = {}
  				options[:action] ||= 'sco-contents'
  				get( options )
  			end

  			# Lists all of the SCOs in a folder, including the contents of subfolders, curriculums, and any type of enclosing SCO.
  			def sco_expanded_contents options = {}
  				options[:action] = 'sco-expanded-contents'
  				sco_contents( options )
  			end
  			alias :check_room :sco_expanded_contents

  			# Deletes one or more objects (SCOs). 
  			# @param options['sco-id'] [Integer] [Required] The unique ID of a folder for which you want to list contents. You can get the sco-id by calling sco-shortcuts.
      		# @return [Hash] HTTP return body
  			def sco_delete options = {}
  				options[:action] = 'sco-delete'
  				get( options )
  			end
  			alias :meeting_delete :sco_delete
  			alias :room_delete :sco_delete
  			alias :folder_delete :sco_delete

  			# Deletes one or more objects (SCOs). 
  			# @param options['sco-id'] [Integer] [Required] The unique ID of a folder for which you want to list contents. You can get the sco-id by calling sco-shortcuts.
      		# @return [Hash] HTTP return body
  			def sco_info options = {}
  				options[:action] = 'sco-info'
  				get( options )
  			end
  			alias :meeting_info :sco_info
  			alias :room_info :sco_delete
  			alias :folder_info :sco_info

  			# Moves a SCO from one folder to another.
  			# @param options['sco-id'] [Integer] [Required] The unique ID of the SCO to move.
  			# @param options['folder-id'] [Integer] [Required] The ID of the destination folder.
      		# @return [Hash] HTTP return body
  			def sco_move options = {}
  				options[:action] = 'sco-move'
  				get( options )
  			end

  			# Describes the folder hierarchy that contains a SCO.
  			# @param options['sco-id'] [Integer] [Required] The unique ID of a SCO for which you want a folder hierarchy up to the root level.
      		# @return [Hash] HTTP return body
  			def sco_nav options = {}
  				options[:action] = 'sco-nav'
  				get( options )
  			end

  			# Provides information about the folders relevant to the current user. These include a folder for the user’s current meetings, a folder for the user’s content, as well as folders above them in the navigation hierarchy.
      		# @return [Hash] HTTP return body
  			def sco_shortcuts options = {}
  				options[:action] = 'sco-shortcuts'
  				get( options )
  			end

  			# Creates metadata for a SCO, or updates existing metadata describing a SCO. 
  			# @param options['author-info-1'] [String] [Optional] Information about the author. Used only with presentations. Can be used for the author’s name or any other information.
  			# @param options['author-info-2'] [String] [Optional] Additional information about the author.
  			# @param options['author-info-3'] [String] [Optional] Additional information about the author. 
  			# @param options['date-begin'] [Datetime] [Optional] The scheduled beginning date and time, in ISO 8601 format. Used only for meetings and courses.
  			# @param options['date-end'] [Datetime] [Optional] The scheduled ending date and time, in ISO 8601 format. Used only for meetings and courses.
  			# @param options['description'] [String] [Optional] A description of the SCO to be displayed in the user interface.
  			# @param options['email'] [String] [Optional] The e-mail address of the contact person for a presentation.
  			# @param options['first-name'] [String] [Optional] The first name of the contact person for a presentation.
  			# @param options['folder-id'] [String] [Optional] The ID of the folder in which a new SCO will be stored. Required for a new SCO, but do not use for an existing SCO..
  			# @param options['lang'] [String] [Optional] An abbreviation for the language associated with the SCO (see http://help.adobe.com/en_US/connect/9.0/webservices/WS5b3ccc516d4fbf351e63e3d11a171ddf77-7f9e_SP1.html for values).
  			# @param options['icon'] [String] [Optional] The visual symbol used to identify a SCO in Connect Central; also provides information about the SCO in addition to its type.
  			# @param options['last-name'] [String] [Optional] The last name of the contact person for a presentation. 
  			# @param options['name'] [String] [Optional] The name of the SCO, with or without spaces. Required to create a SCO.
  			# @param options['sco-id'] [String] [Optional] The unique ID of a SCO to update. Use sco-id or folder-id, but not both. Required to update an existing SCO.
  			# @param options['sco-tag'] [String] [Optional] A label for any information you want to record about a course. Use only with courses.
  			# @param options['source-sco-id'] [String] [Optional] The unique ID of a template you can use to create a meeting or a piece of content from which you can build a course.
  			# @param options['type'] [String] [Optional] The type of the new SCO (for allowed values, see http://help.adobe.com/en_US/connect/9.0/webservices/WS5b3ccc516d4fbf351e63e3d11a171ddf77-7f9c_SP1.html). The default value is content.
  			# @param options['url-path'] [String] [Optional] The custom part of the URL to the meeting room that comes after the domain name. The url-path must be unique within the folder. If not specified, the server assigns a value.
      		# @return [Hash] HTTP return body
  			def sco_update options = {}
  				options[:action] = 'sco-update'
  				options['has-children'] ||= 0
  				get( options )
  			end
  			def room_create options = {}
  				options['type'] = 'meeting'
  				sco_update( options )
  			end
  			alias :create_meeting :room_create
  			alias :create_room :room_create

  			def folder_create options = {}
  				options['type'] = 'folder'
  				sco_update( options )
  			end

  		end
  	end
end