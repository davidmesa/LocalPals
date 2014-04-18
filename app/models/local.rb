class Local < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :activities
end
