class AddOrderToOrderLine < ActiveRecord::Migration
  def change
    add_reference :order_lines, :order, index: true, foreign_key: true
  end
end
