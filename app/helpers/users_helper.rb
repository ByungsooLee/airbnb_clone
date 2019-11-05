module UsersHelper
  def avatar_url(user)
    if user.image
      "#{user.image}?type=large"
    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}?size=250"
    end
  end
end