class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: "Product was created successfully."
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      redirect_to root_path, notice: "Product was updated successfully."
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(
        :name,
        :description,
        :price,
      )
  end
end
