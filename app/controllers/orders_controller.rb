class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render :index
  end

  def create
    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )
    if @order.save
      render :show
    else
      render json: { errors: @order.errors.full_messages }, status: 400
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end
end
