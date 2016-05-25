class User < ActiveRecord::Base
  attr_reader :format_first_name

  def self.from_omniauth(auth_hash)
    # binding.pry
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.location = auth_hash['info']['location']
    user.image_url = auth_hash['info']['image']
    user.oauth_token = auth_hash['credentials']['token']
    user.url = auth_hash['info']['urls'][user.provider.capitalize]
    user.save!
    user
  end

end
