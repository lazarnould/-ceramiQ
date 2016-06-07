class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :gender
      t.string :category
      t.string :description
      t.string :season

      t.timestamps null: false
    end
  end
end
