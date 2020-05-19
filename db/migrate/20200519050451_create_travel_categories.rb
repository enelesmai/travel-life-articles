class CreateTravelCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_categories do |t|
      t.integer :travel_id
      t.integer :category_id

      t.timestamps
    end
    add_foreign_key :travel_categories, :travels, column: :travel_id
    add_foreign_key :travel_categories, :categories, column: :category_id
  end
end
