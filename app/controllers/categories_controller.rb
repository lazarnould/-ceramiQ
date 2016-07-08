class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :show_men, :show_women, :destroy]

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
    @categories = Category.all
  end

  def show
  end

  def show_men
    @products = @category.products.all.select {|product| product.gender == "men"}
    # @products = @category.products.where(gender == "men")
  end

  def show_women
    @products = @category.products.all.select {|product| product.gender == "women"}
  end

  def destroy
    @category.destroy
    flash[:notice] = "The #{@category.name} category has been destroyed"
    redirect_to root_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
