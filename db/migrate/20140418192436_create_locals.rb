class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.text :about_me
      t.text :hobbies
      t.belongs_to :user
      t.timestamps
    end
  end
end
