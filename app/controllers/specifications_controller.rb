class SpecificationsController < ApplicationController

  before_action :find_specification, only: [:show, :edit, :update, :destroy]

  def index
    @specifications = Specification.all
  end

  def show
  end

  def new
    @specification = Specification.new
  end

  def create
    @product = Product.find(params[:product_id])
    @specification = Specification.new(specification_params)
    @specification.product = @product

    if @specification.save
      flash[:notice] = "#{@specification.quantity} #{@specification.product} in #{@specification.color} are now on sale"
      redirect_to product_specification_path(@specification.product, @specification)
    else
      flash[:notice] = "A problem occured, Please try again"
      render :new
    end
  end

  def edit
  end

  def update
    @specification.update(specification_params)
    redirect_to product_specification_path(@specification.product, @specification)
  end

  def destroy
    @specification.destroy
    flash[:notice] = "Specification has been deleted"
    redirect_to root_path
  end

  private

  def find_specification
    @specification = Specification.find(params[:id])
  end

  def specification_params
    params.require(:specification).permit(:code_article, :color, :size, :quantity)
  end
end
