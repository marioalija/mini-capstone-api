class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render :index
  end

  def create
    product = Product.find_by(id: params[:product_id])

    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    # @order.update(subtotal: @order.subtotal, tax: @order.tax, total: @order.total)

    if @order.save #happy path
      render :show
    else #sad path
      render json: { errors: @order.errors.full_messages }, status: 400
    end
  end

  def show
    if (@order = current_user.orders.find_by(id: params[:id]))
      render :show
    else
      render json: { message: "You can only view your own orders" }
    end
  end
end
