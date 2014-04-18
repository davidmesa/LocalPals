class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :address
      t.date :date
      t.text :description
      t.belongs_to :local
      t.timestamps
    end
    create_table :activities_interests do |t|
      t.belongs_to :activity
      t.belongs_to :interest
    end
    create_table :activities_city_trips do |t|
      t.belongs_to :activity
      t.belongs_to :city_trip
    end
  end
end
