module CommonHelpers
  module ViewHelpers

    # TODO write a test.
    def common_link_to(label, path, options={})
      default_arguments(options)

      icon_name = options.delete(:icon)
      css_class = options.delete(:class)
      button    = options.delete(:btn)
      style     = options.delete(:style)

      if button == true
        css_class << "btn"
        css_class << "btn-#{style}" if style.present?
      end

      html_options = {}
      html_options[:class] = css_class.join(' ')
      html_options.merge!(options)

      link_to path, html_options do
        out  = ''
        if icon_name.present?
          out += fontawesome_icon(icon_name) 
          out += '&nbsp;'
        end
        out += label.to_s
      
        out.html_safe
      end
    end

    def common_menu(label, path, options={}, &block)
      menu = options.delete(:menu).to_s
      
      @sub_menus = ''

      if block_given? # tenho sub menus?

        # preencho @sub_menus com o html 
        yield

        # gero um <ul> para o sub menu
        ul_tag = content_tag(:ul, @sub_menus.html_safe, class: 'collapse', id: "menu_#{menu}")

        # marco a <a> do menu como toggable
        options.merge!({
          'data-toggle' => "collapse",
          'data-target' => "#menu_#{menu}"
        })

        # add o caret como label
        label = "#{label} #{fontawesome_icon('caret-down')}"
      end

      # is active?
      li_class = 'active'  if @active_menu.to_s == menu
      
      link_tag = common_link_to(label, path, options)
      content_tag(:li, class: li_class) do
        out  = ''
        out += link_tag
        out += ul_tag if ul_tag

        out.html_safe
      end
    end
    
    def common_sub_menu(label, path, options={})
      link_tag = common_link_to(label, path, options)
      @sub_menus << content_tag(:li, link_tag)
      
      nil # sempre retorna nil para não imprimir no html se o usuário usar <%= ... 
    end
    
    private

    def default_arguments(options)
      if options.has_key? :class and options[:class].is_a? String
        options[:class] = options[:class].split
      else
        options[:class] = []
      end
    end

    def fontawesome_icon(icon_name)
      content_tag(:i, nil, class: "fa fa-#{icon_name}")
    end

  end
end