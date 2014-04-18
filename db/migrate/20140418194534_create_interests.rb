class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :category
      t.string :name

      t.timestamps
    end
    create_table :interests_users do |t|
      t.belongs_to :interest
      t.belongs_to :user
    end
  end
end
