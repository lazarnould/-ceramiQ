class AddProdTypeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :prod_type, :string
  end
end
