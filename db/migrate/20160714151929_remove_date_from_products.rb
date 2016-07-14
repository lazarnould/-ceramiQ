class RemoveDateFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :date, :string
  end
end
