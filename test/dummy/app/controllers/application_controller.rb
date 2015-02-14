# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  include CommonHelpers::ControllerHelpers
  helper  CommonHelpers::ViewHelpers
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
