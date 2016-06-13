class AddOrderToDeliveryInfos < ActiveRecord::Migration
  def change
    add_reference :delivery_infos, :order, index: true, foreign_key: true
  end
end
