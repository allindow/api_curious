class IgPic < OpenStruct
  def self.service(id, current_user)
    IgPicService.new(id, current_user)
  end

  def self.pic(id, current_user)
    pic = service(id, current_user).get_pic_data[:data]
    MediaParser.new(pic)
  end

  def self.comments(id, current_user)
    comments = service(id, current_user).get_comments[:data]
    comments.map do |comment|
      TextParser.new(comment)
    end
  end
end
