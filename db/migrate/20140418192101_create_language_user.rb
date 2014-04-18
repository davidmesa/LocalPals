class CreateLanguageUser < ActiveRecord::Migration
  def change
    create_table :language_users, id: false do |t|
      t.belongs_to :language
      t.belongs_to :user
    end
  end
end
