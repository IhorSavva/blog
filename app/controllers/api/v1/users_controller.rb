class UsersController < ApplicationController
  skip_before_action :current_user, only: [:create]

  def create
    @user = User.new(user_params)

    if @user.save
      head :created
    else
      head :bad_request
    end
  end

  def user_params
    params.require(:user).permit(:password,
                                 :username)
  end
end
