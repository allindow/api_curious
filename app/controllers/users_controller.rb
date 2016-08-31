class UsersController < ApplicationController
  def show
    @recent_media = IgUser.all_pics(current_user)
    @user = IgUser.user_data(current_user)
  end
end
