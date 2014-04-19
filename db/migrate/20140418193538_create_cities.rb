class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :country
      t.string :latitude
      t.string :longitude
      t.string :name
      t.timestamps
    end
  end
end
