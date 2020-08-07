class AddLoanColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :loan_status, :string, default: 'home'
  end
end
