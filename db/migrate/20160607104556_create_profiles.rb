class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :city
      t.integer :zip_code
      t.string :street_name
      t.integer :street_number
      t.integer :phone_number
      t.string :phone_number_prefix
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
