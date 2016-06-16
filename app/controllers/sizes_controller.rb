class SizesController < ApplicationController
  before_action :find_size, only: [:edit, :update, :destroy]

  def new
    @size = Size.new
  end

  def create
    find_product
    find_specification
    @size = Size.new(size_params)
    @size.specification =  @specification

    if @size.save
      flash[:notice] = "#{@size.quantity} items have been added in #{@size.size}"
      redirect_to product_specification_path(@product, @specification)
    else
      flash[:notice] = "A problem occured, try again"
      render :new
    end
  end

  def edit
  end

  def update
    @size.update(size_params)
    redirect_to product_specification_path(@product, @specification)
  end

  def destroy
    @size.destroy
    render :new
  end

  private

  def find_specification
    @specification = Specification.find(params[:id])
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def size_params
    params.require(:size).permit(:size, :quantity)
  end

  def find_size
    @size = Size.find(params[:id])
  end
end
