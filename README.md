# CommonHelpers

Common used Rails helpers. This plugins includes:

* CommonLinkTo:
	* Overrides the link_to helper to use bootstrap and font-awesome easily 
* CommonLinkToMenu: 
	* Associates a common_link_to as a layout menu. Allow controllers to set the current active menu
	* WIP
* CommonBreadcrumbs:
	* WIP


This project rocks and uses MIT-LICENSE.

## Usage

The host app should load bootstrap and font-awesome assets!

	# Gemfile
	gem 'common_helpers', git: 'https://github.com/uchoaaa/common_helpers'
	
	# app/helpers/application_helper.rb
	include CommonHelpers::CommonApplicationHelper
	
	# app/views/...
	<%= common_link_to 'Dashboard', '#', icon: :dashboard, btn: true, style: :primary, class: 'btn-xl'  %>
	