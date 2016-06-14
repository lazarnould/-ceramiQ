class RemoveProductSkuFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :product_sku, :string
  end
end
