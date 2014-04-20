class ActivitiesController < ApplicationController
  respond_to :json

  def index
    printf('entra a index')
    @activities = Activity.all
    respond_with @activities do |format|
      format.json { render json: @activities.to_json }
    end
  end

end