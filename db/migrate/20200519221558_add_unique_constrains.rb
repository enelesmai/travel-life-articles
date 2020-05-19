class AddUniqueConstrains < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :name, unique: true, name: 'unique_username'
    add_index :categories, :name, unique: true, name: 'unique_categoryname'
    add_index :categories, :priority, unique: true, name: 'unique_categorypriority'
  end
end
