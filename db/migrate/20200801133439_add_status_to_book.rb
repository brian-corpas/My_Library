class AddStatusToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :loan_status, :boolean, :default => false
  end
end
