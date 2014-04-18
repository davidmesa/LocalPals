class Review < ActiveRecord::Base
  belongs_to :local
  belongs_to :traveler
end
