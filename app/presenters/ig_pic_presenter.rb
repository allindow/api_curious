class IgPicPresenter
  attr_reader :pic_id, :token

  def initialize(pic_id, token)
    @pic_id = pic_id
    @token  = token
  end

  def comments
    IgPic.comments(pic_id, token)
  end

  def pic
    IgPic.pic(pic_id, token)
  end

end
