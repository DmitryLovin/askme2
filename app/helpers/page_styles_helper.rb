module PageStylesHelper
  def get_color
    session[:navbar_color] || "#DFF6FF"
  end

  def style_with_color
    "background-color:#{get_color};"
  end
end
