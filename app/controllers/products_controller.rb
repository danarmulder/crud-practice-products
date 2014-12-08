class ProductsController < ApplicationController

  def index
    @products = Products.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if product.save
      redirect_to root_path
    else
      render :new
    end
  end

end
