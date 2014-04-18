class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.belongs_to :user
      t.timestamps
    end
  end
end
