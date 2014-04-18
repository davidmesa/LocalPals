class User < ActiveRecord::Base
  has_and_belongs_to_many :languages
  has_one :local
  has_one :traveler
  belongs_to :city
  has_and_belongs_to_many :interests
end
