module UsersHelper
  def profile_picture_url(user)
    if user.profile_picture.attached?
      url_for(user.profile_picture)
    else
      #todo: deliver the image using CDN
      ActionController::Base.helpers.asset_path('default_profile_picture.png')
    end
  end
end