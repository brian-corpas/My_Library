class UsersController < ApplicationController
  def update
    skip_authorization
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :address, :photo)
  end
end
