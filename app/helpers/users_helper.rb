module UsersHelper
  def formatted_nickname(user)
    "@#{user.nickname}"
  end

  def text_color(color)
    if color
      hsl = Color::RGB.by_hex(color).to_hsl
      hsl.lightness = hsl.brightness > 0.5 ? 15 : 85
      hsl.html
    end
  end
end
