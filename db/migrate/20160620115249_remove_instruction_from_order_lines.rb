class RemoveInstructionFromOrderLines < ActiveRecord::Migration
  def change
    remove_column :order_lines, :instruction, :string
  end
end
