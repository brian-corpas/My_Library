class AddDefaultToLoan < ActiveRecord::Migration[6.0]
  def change
    change_column :comics, :loan_status, :string, default: 'home'
  end
end
