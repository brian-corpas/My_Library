class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :name, :title
  end
end
