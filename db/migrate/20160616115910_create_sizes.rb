class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :size
      t.integer :quantity
      t.references :specification, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
