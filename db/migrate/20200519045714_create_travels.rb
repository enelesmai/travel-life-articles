class CreateTravels < ActiveRecord::Migration[5.2]
  def change
    create_table :travels do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.string :image
   
      t.timestamps
    end
  end
end
