class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.string :code_article
      t.string :color
      t.string :size
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
