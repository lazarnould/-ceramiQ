class DeliveryInfosController < ApplicationController
  before_action :find_delivery_infos, only: [:show, :edit, :update]

  def index
    @delivery_infos = Delivery_info.all
  end

  def show
  end

  def new
    @delivery_info = Delivery_info.new
  end

  def create
    @delivery_info = Delivery_info.new(delivery_infos_params)
    @delivery_info.user_id = current_user.id
    if @delivery_info.save
      redirect_to delivery_info_path
    else
      flash[:notice] = "A problem occured, try again"
      render :new
    end
  end

  def edit
  end

  def update
    @delivery_info.update(delivery_infos_params)
    redirect_to delivery_info_path
  end

  private

  def find_delivery_infos
    @delivery_info = Delivery_info.find(params[:id])
  end

  def delivery_infos_params
    params.require(:delivery_info).permit(:country, :city, :zip_code, :street_name, :street_number, :phone_number, :phone_prefix, :first_name, :last_name)
  end
end


