class AddProductToSpecification < ActiveRecord::Migration
  def change
    add_reference :specifications, :product, index: true, foreign_key: true
  end
end
