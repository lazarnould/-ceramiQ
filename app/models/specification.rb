class Specification < ActiveRecord::Base
  belongs_to :product
  has_many :order_lines
  has_many :images
end
