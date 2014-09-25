module CommonApplicationHelper
  
  # TODO write a test.
  def common_link_to(label, path, options={})
    default_arguments(options)

    icon_name = options.delete(:icon)
    css_class = options.delete(:class)
    button    = options.delete(:btn)
    style     = options.delete(:style)
    # menu      = options.delete(:menu)

    if button == true
      css_class << "btn"
      css_class << "btn-#{style}" if style.present?
    end
    
    # if @active_menu.present? and @active_menu == menu
    #   css_class << "active"
    # end
    
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