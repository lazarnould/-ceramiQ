class RemoveQuantityFromSpecifications < ActiveRecord::Migration
  def change
    remove_column :specifications, :quantity, :integer
  end
end
