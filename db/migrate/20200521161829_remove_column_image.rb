class RemoveColumnImage < ActiveRecord::Migration[6.0]
  def change
    remove_column :travels, :image
  end
end
