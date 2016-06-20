class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @orderline = @product.order_lines.new
    @orderline.product = @product.specification(specification_params)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "You've add #{@product.name} on the database, add some specifications to put it on sale"
      redirect_to new_product_specification_path(@product.id)
    else
      flash[:notice] = "A problem occured, try again"
      render :new
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :gender, :price_cents, :category, :description, :season, :photo, :photo_cache)
  end

  def specification_params
    params.require(:specification).permit(:code_article, :color, :size, :quantity)
  end

end

