class Traveler < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :city_trips
end
