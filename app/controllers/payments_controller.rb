class PaymentsController < ApplicationController
 before_action :set_order

 def new
 end

 def create
  @amount_cents = ((@order.make_subtotal) * 100).to_i

  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
    )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @amount_cents, # in cents
    description:  "Payment for #{@order.order_lines.first.product.name} for order #{@order.id}",
    currency:     'eur'
    )

  @order.update(payment: charge.to_json, state: 'paid')
  @order.order_lines.each do |ol|
    spec = ol.specification
    spec.update(quantity: spec.quantity -= ol.quantity)
  end
  redirect_to order_path(@order)

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_order_payment_path(@order)
end

private

def set_order
  @order = current_user.orders.where(state: 'pending', date: Date.today.to_s).find(params[:order_id])
end

end
