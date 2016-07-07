class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "The #{@category.name} category has been destroyed"
      redirect_to new_category_product(@category)
    else
      flash[:alert] = "A problem occured, please try again"
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
