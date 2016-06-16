class RemoveSizeFromSpecifications < ActiveRecord::Migration
  def change
    remove_column :specifications, :size, :string
  end
end
