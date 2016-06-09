class Product < ActiveRecord::Base
  has_many :specifications, dependent: :destroy
end
