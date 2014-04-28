class SearchController < ApplicationController

  respond_to :json

  def search

    user_id = cookies.signed[:user_id]
    user = User.find user_id

    city = params[:city] unless params[:city] == 'City'
    category = params[:category] unless params[:category] == 'Category'
    params[:name] = nil unless params[:name] != ''

    puts 'importante'
    puts city
    puts category
    puts params

    if(city && params[:name] && category)
      puts 1
      activities = Activity.joins(local: {user: :city}).joins(:interests).where('cities.name' => city).where(name: params[:name]).where('interests.name' => category)
    elsif city && params[:name]
      puts 2
      activities = Activity.joins(local: {user: :city}).where('cities.name' => city).where(name: params[:name])
    elsif city && category
      puts 3
      activities = Activity.joins(local: {user: :city}).joins(:interests).where('cities.name' => city).where('interests.name' => category)
    elsif params[:name] && category
      puts 4
      activities = Activity.joins(:interests).where(name: params[:name]).where('interests.name' => category)
    elsif city
      puts 5
      activities = Activity.joins(local: {user: :city}).where('cities.name' => city)
    elsif params[:name]
      puts 6
      activities = Activity.where(name: params[:name])
    elsif category
      puts 7
      activities = Activity.joins(:interests).where('interests.name' => category)
    end

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
        responseParts['reviews'] = []
        reviews = activity.local.reviews
        reviews.each do |review|
          reviewParts = {}
          reviewParts['review'] = review
          reviewParts['travelerImg'] = review.traveler.user.local.img
          responseParts['reviews'] << reviewParts
        end
        response[activity.local.user.city.name] << responseParts
        activities_ids[activity.id] = 'ok'
      end
    end

    render :json => response.to_a
  end

  def basicInfo
    response = {}
    response['cities'] = City.all
    response['categories'] = Interest.all
    respond_with response
  end

end
