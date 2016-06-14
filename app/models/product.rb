class Product < ActiveRecord::Base
  has_many :specifications, dependent: :destroy
  has_many :order_lines

  monetize :price_cents

  mount_uploader :photo, PhotoUploader
end
