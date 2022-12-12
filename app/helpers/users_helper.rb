module UsersHelper
  def formatted_nickname(user)
    "@#{user.nickname}"
  end
end
