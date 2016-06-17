class AddSizeToSpecifications < ActiveRecord::Migration
  def change
    add_column :specifications, :size, :string
  end
end
