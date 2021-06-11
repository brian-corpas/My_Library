class RemoveColumnsFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :category_id
    remove_column :books, :—force
  end
end
 