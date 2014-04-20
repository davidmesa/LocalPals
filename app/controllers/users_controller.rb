class UsersController < ApplicationController
  respond_to :json

  def create

    password = params[:password]
    confirm_password = params[:confirm_password]
    if (confirm_password!=password)
      render json: {errors: 'Password confirmation must be the same as password'}, :status => 422
    else

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
  end

  def get_user
    user_id = cookies.signed[:user_id]
    user_id = 22 unless user_id
    user = User.find user_id
    respond_with(user)
  end

  def login
    printf("entra a login en controller")
    login = params[:login]
    password = params[:password]

    user = User.find_by login: login
    if user
      if (user.password==password)
        cookies.signed[:user_id] = user.id
        respond_with(user)
      else
        render json: {errors: 'Wrong password'}, :status => 422
      end
    else
      render json: {errors: 'User does not exist'}, :status => 422
    end

  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :name, :university, :birthday)
  end

end