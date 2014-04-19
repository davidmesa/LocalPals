class CityTrip < ActiveRecord::Base
  belongs_to :traveler
  has_and_belongs_to_many :activities
  belongs_to :city
end
