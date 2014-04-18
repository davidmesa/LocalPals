class CreateCityTrips < ActiveRecord::Migration
  def change
    create_table :city_trips do |t|
      t.date :ending_date
      t.date :starting_date
      t.belongs_to :traveler

      t.timestamps
    end
  end
end
