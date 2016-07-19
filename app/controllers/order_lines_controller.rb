class OrderLinesController < ApplicationController
  before_action :find_order_line, only: [:edit, :update, :show, :destroy]

  def show
  end

  def new
    @product = Product.find(params[:product_id])
    @order = current_user.orders.last
    @orderline = @product.order_lines.new
    # render layout: nil
  end

  def create
    preorder = current_user.orders.last
    if preorder.date.nil? || preorder.date != Date.today.to_s || preorder.state != 'pending'
      @order = Order.new(user: current_user, state: 'pending', date: Date.today.to_s)
      @order.save
    else preorder.date == Date.today.to_s && preorder.state = 'pending'
      @order = preorder
    end
    @orderline = @order.order_lines.build(order_line_params)
    @product = Product.find(params[:product_id])
    @orderline.product_id = params[:product_id]
    @orderline.price = @product.price_cents
    @order.amount_cents = @order.make_subtotal
    @specification = @product.specifications.find_by(size: @orderline.size, color: @orderline.color).id
    @orderline.specification_id = @specification

    if @orderline.quantity > @orderline.specification.quantity
      flash[:alert] = "The quantity you've ordered of #{@orderline.product.name} exceed the stock"
      return redirect_to product_path(@product)
    elsif @orderline.quantity == 0
      flash[:alert] = "Please select a quantity"
      return redirect_to product_path(@product)
    end

    if @orderline.save
      flash[:notice] = "#{order_line_params["quantity"]} #{@product.name} has been added to your basket"
      redirect_to product_path(@product)
    else
      flash[:alert] = "A problem occured, try againalert"
      @product = Product.find(params[:product_id])
      @orderline = @item.order_lines.new
      redirect_to product_path(@product)
      #redirect_to new_store_item_order_line_path(@store, params[:item_id])
    end
  end

  def edit
  end

  def update
    @orderline.update(order_line_params)
    redirect_to order_path(@orderline.order)
  end

  def destroy
    @order_line.destroy
    redirect_to order_path(@orderline.order)
  end

  private

  def order_line_params
    params.require(:order_line).permit(:size, :quantity, :color)
  end

  def find_order_line
    @orderline = OrderLine.find(params[:id])
  end

end
