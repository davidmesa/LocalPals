class AddCityToCityTrips < ActiveRecord::Migration
  def change
    add_column :city_trips, :city_id, :integer
    add_index :city_trips, :city_id
  end
end
