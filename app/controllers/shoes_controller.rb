class ShoesController < ApplicationController
  def index
    @shoes = Shoe.all
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.create(shoe_params)
    if @shoe.save
      redirect_to shoe_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @shoe = Shoe.find(params[:id])
  end

  def update
    @shoe = Shoe.find(params[:id])
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    @shoe.destroy
    redirect_to shoe_path, status: :see_other
  end

  def shoe_params
    params.require(@shoe).permit(:title, :description, :price, :sizes, :photo)
  end
end
