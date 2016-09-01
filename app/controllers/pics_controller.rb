class PicsController < ApplicationController
  def show
    @media = IgPicPresenter.new(params["id"], current_user.oath_token)
    render :layout => false
  end
end
