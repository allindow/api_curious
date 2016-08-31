class PicsController < ApplicationController
  def show
    @pic = IgPic.pic(params["id"], current_user)
    @comments = IgPic.comments(params["id"], current_user)
  end
end
