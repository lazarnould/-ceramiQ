class AddColorToOrderLines < ActiveRecord::Migration
  def change
    add_column :order_lines, :color, :string
  end
end
