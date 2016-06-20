class RemoveProductIdFromOrderLines < ActiveRecord::Migration
  def change
    remove_reference :order_lines, :product, index: true, foreign_key: true
  end
end
