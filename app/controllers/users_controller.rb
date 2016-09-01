class UsersController < ApplicationController
  def show
    @user = IgUserPresenter.new(current_user.uid, current_user.oath_token)
    @media = Kaminari.paginate_array(@user.recent_media).page(params[:media_page]).per(3)
  end
end
