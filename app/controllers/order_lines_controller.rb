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
    @order = current_user.orders.last
    if  !@order
      @order = Order.create(user: current_user)
    end
    @product = Product.find(params[:product_id])
    @orderline = @order.order_lines.build(order_line_params)
    @orderline.product_id = params[:product_id]
    if @orderline.quantity > @orderline.product.specification.quantity
      flash[:notice] = "The quantity you've ordered of #{@orderline.product} exceed the stock"
      render :new
    elsif @orderline.quantity == 0
      flash[:notice] = "Please select a quantity"
      render :new
    end

    if @orderline.save
      flash[:notice] = "#{order_line_params["quantity"]} #{@item.name} has been added to your basket"
      redirect_to order_path(@order)
    else
      @product = Product.find(params[:item_id])
      @orderline = @item.order_lines.new
      render :new
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
    params.require(:order_line).permit(:size, :quantity, :instruction)
  end

  def find_order_line
    @orderline = OrderLine.find(params[:id])
  end

end
