class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    if !@orders
      flash[:notice] = "You have no orders yet"
    else
      @orders .each do |order|
        subtotal = order.make_subtotal
      end
      # @pricing = @order.size_and_price
      @order_lines.each do |order_line|
        order_line.product.price
      end
    end
  end

  def show
  end

  def new
  end

  def create

  end

  def edit
  end

  def update
    @order = current_user.orders.find_by_id(params[:id])
    @subtotal = @order.make_subtotal
    @order.delivery_infos
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path
  end
end
