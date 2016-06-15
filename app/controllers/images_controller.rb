class ImagesController < ApplicationController
  before_action :find_image, only: [:edit, :update, :destroy]

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Image successfully added"
      redirect_to
  end

  def edit
  end

  def update
  end

  def destroy
    @image.destroy
    redirect_to product_specification_path(@image.specification.product_id, @image.specification_id)
  end

  private

  def find_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:photo)
  end
end
