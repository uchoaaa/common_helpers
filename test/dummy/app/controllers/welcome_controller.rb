class WelcomeController < ApplicationController
  def index
    @active_menu = :products
  end
end
