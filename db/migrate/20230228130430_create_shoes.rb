class CreateShoes < ActiveRecord::Migration[7.0]
  def change
    create_table :shoes do |t|
      t.string :title
      t.text :description
      t.integer :sizes
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
