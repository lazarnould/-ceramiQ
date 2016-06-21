class RemoveSpecificationIdFromOrderLines < ActiveRecord::Migration
  def change
    remove_reference :order_lines, :specification, index: true, foreign_key: true
  end
end
