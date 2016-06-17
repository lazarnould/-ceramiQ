class AddQuantityToSpecifications < ActiveRecord::Migration
  def change
    add_column :specifications, :quantity, :integer
  end
end
