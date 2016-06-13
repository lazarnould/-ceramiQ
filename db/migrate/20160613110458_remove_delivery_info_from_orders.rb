class RemoveDeliveryInfoFromOrders < ActiveRecord::Migration
  def change
    remove_reference :orders, :delivery_info, index: true, foreign_key: true
  end
end
