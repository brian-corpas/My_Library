class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :title
      t.string :artist
      t.text :info
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
