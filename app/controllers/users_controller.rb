class UsersController < ApplicationController
  respond_to :json

  def create

    city_name = params[:city]
    city = City.new
    city.name = city_name
    city.save()

    user = User.new(user_params)
    user.city = city
    user.save()

    cookies.signed[:user_id] = user.id

    university = params[:university]
    about_me = params[:about_me]
    hobbies = params[:hobbies]
    local = Local.new
    local.user = user
    local.university = university
    local.about_me = about_me
    local.hobbies = hobbies
    local.save()

    traveler = Traveler.new
    traveler.user = user
    traveler.save()

    respond_with(user)
  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :name, :university, :birthday)
  end

end