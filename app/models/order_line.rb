class OrderLine < ActiveRecord::Base
  belongs_to :order
  has_one :specification
  has_one :product, through: :specification
end
