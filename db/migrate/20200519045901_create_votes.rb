class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :travel_id

      t.timestamps
    end
    add_foreign_key :votes, :users, column: :user_id
    add_foreign_key :votes, :travels, column: :travel_id
  end
end
