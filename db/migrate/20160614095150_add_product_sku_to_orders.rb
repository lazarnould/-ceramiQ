class AddProductSkuToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :product_sku, :string
  end
end
