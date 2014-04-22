class FeedTravelerController < ApplicationController

  respond_to :json


  def show
    user_id = cookies.signed[:user_id]
    user_id = 3 unless user_id
    user = User.find user_id

    cities = []

    city_trips = user.traveler.city_trips

    city_trips.each do |city_trip|
      cities << city_trip.city.id
    end

    activities = Activity.joins(interests: :users).joins(local: {user: :city}).where('users.id' => user_id).where('cities.id' => cities)

    response = {}

    activities_ids = {}

    activities.each do |activity|
      response[activity.local.user.city.name] = [] unless response.has_key? activity.local.user.city.name
      if(!activities_ids.has_key? activity.id)
        responseParts = {}
        responseParts['activity'] = activity
        responseParts['local'] = activity.local
        response[activity.local.user.city.name] << responseParts
        activities_ids[activity.id] = 'ok'
      end
    end

    render :json => response.to_a

  end

  def addCity
    start_date = params[:start_date]
    end_date = params[:end_date]
    city = 'Bogota'
    cityOb= City.where(name: city).first
    unless cityOb
      cityOb = City.new
      cityOb.name = city
      cityOb.country= 'Colombia'
      cityOb.save
    end
    city_trip = CityTrip.new
    city_trip.starting_date= start_date
    city_trip.ending_date= end_date
    city_trip.city = cityOb
    city_trip.save
    user = User.find cookies.signed[:user_id]
    user.traveler.city_trips << city_trip
    render :json => city_trip
  end

end
