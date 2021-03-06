class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.where(state: 'paid').find(params[:id])
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
    @order.delivery_infos.update(delivery_infos_paramss)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path
  end

  def current_order
    if current_user.orders.present?
      last_order = current_user.orders.last
      if last_order.state == 'pending' && last_order.date == Date.today.to_s
        @order = last_order
      else
        @order == nil
      end
    end
  end

# checkout to add


  private
  def delivery_infos_params
    params.require(:delivery_info).permit(:country, :city, :zip_code, :street_name, :street_number, :phone_number, :phone_prefix, :first_name, :last_name)
  end
end
