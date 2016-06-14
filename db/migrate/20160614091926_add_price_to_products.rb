class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_monetize :products, :price, currency: { present: false }
  end
end
