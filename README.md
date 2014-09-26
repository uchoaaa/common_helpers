# CommonHelpers

Common used Rails helpers. This plugins includes:

* CommonLinkTo:
	* Overrides the link_to helper to use bootstrap and font-awesome easily 
* CommonLinkToMenu: 
	* Associates a common_link_to as a layout menu. Allow controllers to set the current active menu
* CommonBreadcrumbs:
	* _WIP_


This project rocks and uses MIT-LICENSE.

## Usage

The host app should load bootstrap and font-awesome assets!

	# Gemfile
	gem 'common_helpers', git: 'https://github.com/uchoaaa/common_helpers'
	
	# app/helpers/application_helper.rb
	include CommonHelpers::CommonApplicationHelper
	
### CommonLinkTo

	<%= common_link_to 'Dashboard', '#', icon: :dashboard, btn: true, style: :primary %>
	
	# and the output:
	<a class="btn btn-primary" href="#"><i class="fa fa-dashboard"></i>&nbsp;Dashboard</a>
	
### CommonLinkToMenu
	
	<ul class="sidebar-menu">
		<%= common_link_to 'Products', products_path,  icon: :cubes, menu: :products %>
	</ul>
	
	class ProductsController
		def index
			active_menu :products
			# ...
		end
	end
	
	
	
	