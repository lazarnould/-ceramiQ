class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_lines, dependent: :destroy
  has_one :delivery_info, dependent: :destroy

  monetize :amount_cents

  def make_subtotal
    subtotal = 0
    self.order_lines.each do |order_line|
        subtotal += order_line.quantity * order_line.product.price
    end
    subtotal
  end

end
