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

      respond_with(user)
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
        puts 'entra'
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