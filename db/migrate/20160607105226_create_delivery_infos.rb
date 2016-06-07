class CreateDeliveryInfos < ActiveRecord::Migration
  def change
    create_table :delivery_infos do |t|
      t.string :country
      t.string :city
      t.integer :zip_code
      t.string :street_name
      t.integer :street_number
      t.integer :phone_number
      t.string :phone_prefix
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
