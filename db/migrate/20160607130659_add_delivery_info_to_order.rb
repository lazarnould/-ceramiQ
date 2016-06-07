class AddDeliveryInfoToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :delivery_info, index: true, foreign_key: true
  end
end
