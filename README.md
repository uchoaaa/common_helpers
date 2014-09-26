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
	
	<ul class="nav-bar">
		<%= common_menu 'Produts', '#', icon: :cubes, menu: :products  %>

		<%= common_menu 'Orders',  '#', icon: :star,  menu: :orders do %>
			<% common_sub_menu 'Inactive', '#', icon: :play %>
			<% common_sub_menu 'Active', 	 '#', icon: :flag %>
		<% end %>
	</ul>

	
	class ProductsController
		def index
			# makes the the Products menu item highlight
			active_menu :products
			# could be :orders too
		end
	end
	
	
	
	