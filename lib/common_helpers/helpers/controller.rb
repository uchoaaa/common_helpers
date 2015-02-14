# -*- encoding : utf-8 -*-
module CommonHelpers
  module ControllerHelpers

    # TODO: make this helper Class level, to call once for all controller actions
    def active_menu(menu_name)
      @active_menu = menu_name
    end

  end
end
