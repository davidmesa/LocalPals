class AddStartDateAndEndDateToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :start_date, :datetime
    add_column :activities, :end_date, :datetime
    remove_column :activities, :date
  end
end
