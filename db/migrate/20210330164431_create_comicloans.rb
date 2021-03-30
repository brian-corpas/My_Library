class CreateComicloans < ActiveRecord::Migration[6.0]
  def change
    create_table :comicloans do |t|
      t.string :name
      t.string :date
      t.references :comic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
