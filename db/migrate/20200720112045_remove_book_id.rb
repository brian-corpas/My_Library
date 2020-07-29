class RemoveBookId < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :book_id
  end
end
