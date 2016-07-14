class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index_men
    @products = Product.all.select {|product| product.gender == "men"}
    list_types
    colors
  end

  def index_women
    @products = Product.all.select {|product| product.gender == "Women"}
    list_types
    colors
  end

  def index_accessories
    @products = Product.all.select {|product| product.gender == "Accessories"}
    list_types
    colors
  end

  def show
    @orderline = OrderLine.new
  end

  def new
    @category = Category.find(params[:category_id])
    @product = Product.new
  end

  def create
    @category = Category.find(params[:category_id])
    @product = Product.new(product_params)
    @product.category = @category
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

  def colors
    colors = []
    @products.each do |prod|
      prod.specifications.each do |spec|
      colors << spec.color
      end
    end
    @colors = colors.uniq
  end

  def list_types
    types = []
    @products.each do |product|
      types << product.type
      @types = types.uniq
    end
  end

  def product_params
    params.require(:product).permit(:name, :gender, :price_cents, :category, :description, :season, :photo, :photo_cache, :type)
  end

  def specification_params
    params.require(:specification).permit(:code_article, :color, :size, :quantity)
  end

end

