module CommonApplicationHelper

  # TODO: make this helper Class level, to call once for all controller actions
  def active_menu(menu_name)
    @active_menu = menu_name
  end

  # TODO write a test.
  def common_link_to(label, path, options={})
    default_arguments(options)

    icon_name = options.delete(:icon)
    css_class = options.delete(:class)
    button    = options.delete(:btn)
    style     = options.delete(:style)
    menu      = options.delete(:menu)

    if button == true
      css_class << "btn"
      css_class << "btn-#{style}" if style.present?
    end

    html_options = {}
    html_options[:class] = css_class.join(' ')
    html_options.merge!(options)

    html = link_to path, html_options do
      out  = ''
      if icon_name.present?
        out += fontawesome_icon(icon_name) 
        out += '&nbsp;'
      end
      out += label.to_s
      
      out.html_safe
    end

    if menu.present?
      # encapsulates link tag into a <li></li>
      if @active_menu == menu
        li_class = 'active' 
      end

      html = content_tag(:li, html, class: li_class)
    end

    html
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