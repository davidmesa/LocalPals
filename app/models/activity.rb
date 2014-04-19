class Activity < ActiveRecord::Base
  has_and_belongs_to_many :interests
  belongs_to :local
  has_and_belongs_to_many :city_trips
  has_one :city, through: :local
end
