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

    activities.each do |activity|
      response[activity.local.user.city.name] = [] unless response.has_key? activity.local.user.city.name
      response[activity.local.user.city.name] << activity
    end

    render :json => response.to_a

  end

end
