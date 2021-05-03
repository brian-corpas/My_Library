class AddColumnsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :category_id, :string
    add_column :books, :—force, :string
  end
end
