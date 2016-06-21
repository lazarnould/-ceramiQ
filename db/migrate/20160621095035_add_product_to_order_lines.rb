class AddProductToOrderLines < ActiveRecord::Migration
  def change
    add_reference :order_lines, :product, index: true, foreign_key: true
  end
end
