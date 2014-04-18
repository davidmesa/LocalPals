class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.date :date
      t.integer :rank
      t.belongs_to :local
      t.belongs_to :traveler
      t.timestamps
    end
  end
end
