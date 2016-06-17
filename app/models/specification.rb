class Specification < ActiveRecord::Base
  belongs_to :product
  has_many :sizes
end
