class Product < ActiveRecord::Base
  has_many :specifications, dependent: :destroy
  has_many :order_lines
end
