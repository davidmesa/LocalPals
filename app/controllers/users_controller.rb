class UsersController < ApplicationController
  respond_to :json

  def create
    user = User.new(user_params)
    user.save()
    respond_with(user)
  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :name, :university, :birthday)
  end
end