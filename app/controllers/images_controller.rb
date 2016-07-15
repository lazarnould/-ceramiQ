class ImagesController < ApplicationController
  before_action :find_image, only: [:edit, :update, :destroy]

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.specification = Specification.find(params[:specification_id])
    if @image.save
      flash[:notice] = "Image successfully added"
      redirect_to product_specification_path(@image.specification.product, @image.specification)
    else
      flash[:notice] = "An error occured, try again"
      render :new
    end
  end

  def edit
  end

  def update
    @image.update(image_params)
    redirect_to product_specification_path(@image.specification.product, @image.specification)
  end

  def destroy
    @image.destroy
    redirect_to product_specification_path(@image.specification.product, @image.specification)
  end

  private

  def find_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:photo)
  end
end
