class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.string :size
      t.integer :quantity
      t.string :instruction

      t.timestamps null: false
    end
  end
end
