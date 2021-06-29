module UsersHelper
  def profile_picture_for(user)
    if user.profile_picture.attached?
      user.profile_picture
    else
      'default_profile_picture.jpg'
    end
  end
end