class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :travel_id

      t.timestamps
    end
  end
end
