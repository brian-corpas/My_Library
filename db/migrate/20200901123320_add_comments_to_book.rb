class AddCommentsToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :comments, :string
  end
end
