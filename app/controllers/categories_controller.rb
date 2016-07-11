class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :show_accessory, :show_men, :show_women, :destroy]
  before_action :cat_index, only: [:show, :show_accessory, :show_men, :show_women, :index]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "The #{@category.name} category has been created"
      redirect_to new_category_product_path(@category)
    else
      flash[:alert] = "A problem occured, please try again"
      render :new
    end
  end

  def index
  end

  def show
  end

  def show_accessory
    @products = @category.products.all.select {|product| product.gender == "Accessory"}
    list_types
    colors
  end

  def show_men
    @products = @category.products.all.select {|product| product.gender == "Men"}
    list_types
    colors
  end

  def show_women
    @products = @category.products.all.select {|product| product.gender == "Women"}
    list_types
    colors
  end

  def destroy
    @category.destroy
    flash[:notice] = "The #{@category.name} category has been destroyed"
    redirect_to root_path
  end


  private

  def colors
    colors = []
    @products.each do |prod|
      prod.specifications.each do |spec|
      colors << spec.color
      end
    end
    @colors = colors.uniq
  end

  def cat_index
    @categories = Category.all
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def list_types
    types = []
    @products.each do |product|
      product.type >> types
      @types = types.uniq
    end
  end

  def category_params
    params.require(:category).permit(:name,:photo, :photo_cache)
  end
end
