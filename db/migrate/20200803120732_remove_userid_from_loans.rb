class RemoveUseridFromLoans < ActiveRecord::Migration[6.0]
  def change
    remove_column :loans, :user_id
  end
end
