class ActivitiesController < ApplicationController
  respond_to :json

  def index
    printf('entra a index')
    user_id = cookies.signed[:user_id]
    user_id = 22 unless user_id
    @activities = Activity.where local_id: user_id
    respond_with @activities do |format|
      format.json { render json: @activities.to_json }
    end
  end

  def create
    activity = Activity.new(activity_params)
    user_id = cookies.signed[:user_id]
    user_id = 22 unless user_id
    activity.local_id = user_id
    getInterests(params[:interests]).each do |interest|
      activity.interests << interest
    end
    activity.save()
    respond_with(activity)
  end

  def show
    printf('entro a show activity')
    @activity = Activity.find(params[:id])
    respond_with(@activity)
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