class AddImgAndNameToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :img, :string
    add_column :activities, :name, :string
  end
end
