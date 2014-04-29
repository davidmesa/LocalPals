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
        responseParts['city_trip'] = CityTrip.find_by('traveler_id = :trav_id AND city_id = :cit_id',
                                                    {trav_id: user.traveler.id, cit_id: activity.local.user.city.id})
        #responseParts['reviews'] = []
        #reviews = activity.local.reviews
        #reviews.each do |review|
        #  reviewParts = {}
        #  reviewParts['review'] = review
        #  reviewParts['travelerImg'] = review.traveler.user.local.img
        #  responseParts['reviews'] << reviewParts
        #end
        response[activity.local.user.city.name] << responseParts
        activities_ids[activity.id] = 'ok'
      end
    end

    render :json => response.to_a

  end

  def addCity
    start_date = params[:start_date]
    end_date = params[:end_date]
    city = params[:city]
    cityOb= City.where(name: city).first
    unless cityOb
      cityOb = City.new
      cityOb.name = city
      cityOb.country= 'Colombia'
      cityOb.save
    end
    city_trip = CityTrip.new
    city_trip.starting_date= DateTime.strptime(start_date, '%m/%d/%Y')
    city_trip.ending_date= DateTime.strptime(end_date, '%m/%d/%Y')
    city_trip.city = cityOb
    city_trip.save
    user = User.find cookies.signed[:user_id]
    user.traveler.city_trips << city_trip
    render :json => city_trip
  end

  def addActivity
    activityId = params[:activity_id]
    acticity = Activity.find activityId

    cityTripId = params[:city_id]
    cityTrip = CityTrip.find cityTripId

    cityTrip.activities << acticity

    respond_with(acticity)

  end

  def addReview
    comment = params[:comment]
    user_id = cookies.signed[:user_id]
    user = User.find user_id
    local_id = params[:local_id]

    review = Review.new
    review.comment = comment
    review.local = Local.find local_id
    review.traveler = user.traveler
    review.save()


    reviewParts = {}
    reviewParts['review'] = review
    reviewParts['travelerImg'] = review.traveler.user.local.img

    render :json => reviewParts

  end

  def showReview
    puts('BAJAAAAA AL CONTROLADOOOR!!!! EN SHOW REVIEW')

    activity = Activity.find(params[:activity_id])

        responseParts = []
        reviews = activity.local.reviews
        reviews.each do |review|
          reviewParts = {}
          reviewParts['review'] = review
          reviewParts['travelerImg'] = review.traveler.user.local.img
          responseParts << reviewParts
        end


    render :json => responseParts

  end

end