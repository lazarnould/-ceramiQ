class DeliveryInfosController < ApplicationController
  before_action :find_delivery_infos, only: [:show, :edit, :update]

  def index
    @delivery_infos = DeliveryInfo.all
  end

  def show
  end

  def new
    if @delivery_info.order.user.profile.nil?
      @delivery_info = DeliveryInfo.new
    else
      @delivery_info = DeliveryInfo.new
      @delivery_info.order = Order.find(params[:order_id])
      @delivery_info.country = @delivery_info.order.user.profile.country
      @delivery_info.city = @delivery_info.order.user.profile.city
      @delivery_info.zip_code = @delivery_info.order.user.profile.zip_code
      @delivery_info.street_name = @delivery_info.order.user.profile.street_name
      @delivery_info.street_number = @delivery_info.order.user.profile.street_number
      @delivery_info.phone_prefix = @delivery_info.order.user.profile.phone_number_prefix
      @delivery_info.phone_number = @delivery_info.order.user.profile.phone_number
      @delivery_info.first_name = @delivery_info.order.user.profile.first_name
      @delivery_info.last_name = @delivery_info.order.user.profile.last_name
      @delivery_info.save
      redirect_to current_order_path
    end
  end

  def create
    @delivery_info = DeliveryInfo.new(delivery_infos_params)
    @delivery_info.order = Order.find(params[:order_id])
    if @delivery_info.save
      redirect_to delivery_info_path(@delivery_info)
    else
      flash[:notice] = "A problem occured, try again"
      render :new
    end
  end

  def edit
  end

  def update
    @delivery_info.update(delivery_infos_params)
    redirect_to delivery_info_path(@delivery_info)
  end

  private

  def find_delivery_infos
    @delivery_info = DeliveryInfo.find(params[:id])
  end

  def delivery_infos_params
    params.require(:delivery_info).permit(:country, :city, :zip_code, :street_name, :street_number, :phone_number, :phone_prefix, :first_name, :last_name)
  end
end


