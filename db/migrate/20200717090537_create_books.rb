class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_id
      t.string :name
      t.string :author
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
