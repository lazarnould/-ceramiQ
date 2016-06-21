class Product < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  monetize :price_cents

  has_many :specifications, dependent: :destroy
  has_many :order_lines
  has_many :orders, through: :order_lines



end
