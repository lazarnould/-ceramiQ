class AddDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :date, :string
  end
end
