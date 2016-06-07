class AddUsertoDeliveryInfo < ActiveRecord::Migration
  def change
    add_reference :delivery_infos, :user, index: true, foreign_key: true
  end
end
