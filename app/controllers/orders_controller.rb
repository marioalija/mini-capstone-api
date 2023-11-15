class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
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
    @order.update(subtotal: @order.subtotal, tax: @order.tax, total: @order.total)
    if @order.save
      render :show
    else
      render json: { errors: @order.errors.full_messages }, status: 400
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    if current_user && current_user.id == @order.user_id
      render :show
    else
      render json: { message: "You can only view your own orders" }
    end
  end
end
