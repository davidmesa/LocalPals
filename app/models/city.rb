class City < ActiveRecord::Base
  has_many :users
  has_many :city_trips
end
