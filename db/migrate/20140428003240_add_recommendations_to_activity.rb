class AddRecommendationsToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :recommendations, :text
  end
end
