class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :colection
      t.text :comments
      t.string :loan_status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
