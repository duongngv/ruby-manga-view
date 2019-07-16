module UsersHelper
  def display_avatar user, size = Settings.user.gravatar_size
    if user.avatar_user.url
      image_tag(user.avatar_user.to_s, size: "#{size}x#{size}", class: "avatar")
    else
      image_tag("avatar-default.png", size: "#{size}x#{size}", class: "avatar")
    end
  end
end
