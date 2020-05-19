class CreateTravelCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_categories do |t|
      t.integer :travel_id
      t.integer :category_id

      t.timestamps
    end
  end
end
