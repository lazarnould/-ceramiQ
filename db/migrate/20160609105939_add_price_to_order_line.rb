class AddPriceToOrderLine < ActiveRecord::Migration
  def change
    add_column :order_lines, :price, :integer
  end
end
