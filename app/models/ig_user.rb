class IgUser < OpenStruct
  def self.service(uid, token)
    @@service ||= IgUserService.new(uid, token)
  end

  def self.all_pics(uid, token)
    pics = service(uid, token).get_user_pics[:data]
    pics.map do |pic_hash|
      MediaParser.new(pic_hash)
    end
  end

  def self.user_data(uid, token)
    user_data = service(uid, token).get_user_data
    IgUser.new(user_data[:data])
  end

  def following_count
    counts[:follows]
  end

  def follower_count
    counts[:followed_by]
  end

  def post_count
    counts[:media]
  end

end
