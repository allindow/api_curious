class IgUser < OpenStruct
  def self.service(current_user)
    @@service ||= IgUserService.new(current_user)
  end

  def self.all_pics(current_user)
    pics = service(current_user).get_user_pics[:data]
    pics.map do |pic_hash|
      MediaParser.new(pic_hash)
    end
  end

  def self.user_data(current_user)
    user_data = service(current_user).get_user_data
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
