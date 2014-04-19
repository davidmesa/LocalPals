class AddImgToLocal < ActiveRecord::Migration
  def change
    add_column :locals, :img, :string
  end
end
