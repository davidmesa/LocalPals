class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.date :birthday
      t.string :login
      t.string :password
      t.timestamps
    end
  end
end
