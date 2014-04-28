class ActivitiesController < ApplicationController
  respond_to :json

  def index
    printf('\n ENTRAAAA A INDEX \n')
    user_id = cookies.signed[:user_id]
    user_id = 22 unless user_id
    user = User.find user_id

    activities = Activity.where local: user.local
    #respond_with @activities do |format|
    #  format.json { render json: activities.to_json }
    #end

    response = []

    activities.each do |activity|
      #response[activity.id] = [] unless response.has_key? activity.id
      responseParts = {}
      responseParts['activity'] = activity
      responseParts['attending'] = []
      attending = activity.city_trips

      attending.each do |ct|
      responseParts['attending'] << ct.traveler.user.local
      end

      #response[activity.id] << responseParts
      response << responseParts
    end
    render :json => response

  end

  def create
    activity = Activity.new(activity_params)
    user_id = cookies.signed[:user_id]
    user_id = 22 unless user_id
    user = User.find user_id
    activity.local = user.local
    getInterests(params[:interests]).each do |interest|
      activity.interests << interest
    end
    activity.save()
    respond_with(activity)
  end

  def show
    printf('\n ENTRAAAA A SHOW \n')
    activity = Activity.find(params[:id])
    #respond_with(activity)

    response = {}
    response['activity'] = activity
    response['attending'] = {}
    attending = activity.city_trips
    attending.each do |ct|
      response['attending'] << ct.traveler.user
    end
    render :json => response

  end
  private

  def activity_params
    params.require(:activity).permit(:name, :description, :address, :img, :start_date, :end_date)
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