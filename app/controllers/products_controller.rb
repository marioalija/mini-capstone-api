class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def create
    @product = Product.create(
      name: "Sony TV",
      price: 2000,
      image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr0zuY28I0HoftTvVDFZ82xcjOaDCUYm8v_A&usqp=CAU",
      description: "Best resolution and colors from any other television",
    )
    render :show
  end
end
