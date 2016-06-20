class AddSpecificationToOrderLines < ActiveRecord::Migration
  def change
    add_reference :order_lines, :specification, index: true, foreign_key: true
  end
end
