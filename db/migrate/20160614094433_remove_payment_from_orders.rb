class RemovePaymentFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :payment, :boolean
  end
end
