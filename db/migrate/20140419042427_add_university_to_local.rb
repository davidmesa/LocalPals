class AddUniversityToLocal < ActiveRecord::Migration
  def change
    add_column :locals, :university, :string
  end
end
