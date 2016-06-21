class SpecificationsController < ApplicationController

  before_action :find_product, only: [:show, :new, :create, :edit, :update]
  before_action :find_specification, only: [:show, :edit, :update]

  def index
    @specifications = Specification.all
  end

  def show
    @image = Image.new
  end

  def new
    @specification = Specification.new
  end

  def create
    @specification = Specification.new(specification_params)
    @specification.product = @product

    if @specification.save
      flash[:notice] = "#{@specification.product.name} in #{@specification.color} is now created, please add some stock"
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


  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_specification
    @specification = Specification.find(params[:id])
  end

  def specification_params
    params.require(:specification).permit(:code_article, :color, :size, :quantity)
  end
end
