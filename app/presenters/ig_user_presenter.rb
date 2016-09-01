class IgUserPresenter
  attr_reader :uid, :token

  def initialize(uid, token)
    @uid   = uid
    @token = token
  end

  def details
    IgUser.user_data(uid, token)
  end

  def recent_media
    IgUser.all_pics(uid, token)
  end

end
