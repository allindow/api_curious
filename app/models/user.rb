class User < ApplicationRecord
  has_many :pics

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                  = auth_info.uid
      new_user.username             = auth_info.extra.raw_info.username
      new_user.full_name            = auth_info.extra.raw_info.full_name
      new_user.bio                  = auth_info.extra.raw_info.bio
      new_user.profile_picture      = auth_info.extra.raw_info.profile_picture
      new_user.oath_token           = auth_info.credentials.token
      new_user.oath_token_secret    = auth_info.extra.raw_info.username
    end
  end

end
