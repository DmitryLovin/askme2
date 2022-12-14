module UsersHelper
  def formatted_nickname(user)
    "@#{user.nickname}"
  end

  def text_color(color)
    if color
      hsl = Color::RGB.by_hex(color).to_hsl
      if hsl.brightness > 0.5
        hsl.lightness = 15
      else
        hsl.lightness= 85
      end
      hsl.html
    end
  end
end
