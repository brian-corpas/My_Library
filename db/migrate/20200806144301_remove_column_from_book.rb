class RemoveColumnFromBook < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :loan_status
  end
end
