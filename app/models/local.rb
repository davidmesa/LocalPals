class Local < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :activities
  has_one :city, through: :user

end
