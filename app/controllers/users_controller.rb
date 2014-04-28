class UsersController < ApplicationController
  respond_to :json

  def create

    password = params[:password]
    confirm_password = params[:confirm_password]
    if (confirm_password!=password)
      render json: {errors: 'Password confirmation must be the same as password'}, :status => 422
    else

      city_name = params[:city]
      city = City.find_by name: city_name
      if (city)
        printf('Ciudad ya existe')
      else
        printf('Ciudad no existe')
        city = City.new
        city.name = city_name
        city.save()
      end

      user = User.new(user_params)
      user.city = city
      getInterests(params[:interests]).each do |interest|
        user.interests << interest
      end
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

      #respond_with(user)
      response = {}
      response['user'] = user
      response['local'] = user.local
      render :json => response
    end
  end

  def get_user
    printf('obtiene usuario')
    user_id = cookies.signed[:user_id]
    user_id = 22 unless user_id
    user = User.find user_id
    respond_with(user)
  end

  def login
    login = params[:login]
    password = params[:password]

    user = User.find_by login: login
    if user
      if (user.password==password)
        cookies.signed[:user_id] = user.id
        #respond_with(user)
        response = {}
        response['user'] = user
        response['local'] = user.local
        render :json => response
      else
        render json: {errors: 'Wrong password'}, :status => 422
      end
    else
      render json: {errors: 'User does not exist'}, :status => 422
    end



  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :name, :university, :birthday, :interests)
  end

  def getInterests(interests)
    response = []
    interests.each do |interest|
      rinterest = Interest.where(:name => interest)
      if rinterest.empty?
        rinterest = Interest.new
        rinterest.name = interest
        rinterest.save
      else
        rinterest = rinterest.first
      end
      response << rinterest
    end
    response
  end

end