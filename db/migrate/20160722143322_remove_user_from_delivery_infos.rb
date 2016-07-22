class RemoveUserFromDeliveryInfos < ActiveRecord::Migration
  def change
    remove_reference :delivery_infos, :user, index: true, foreign_key: true
  end
end
