class OrderItensController < ApplicationController
  def new
  end

  def create
    @order_item = OrderItem.create(order_item_params)
    @order_item.order = retrieve_order
    if @order_item.save
      redirect_to @order_item.order
    else
     render 'new'
    end
  end

  def order_item_params
    params.require(:order_item).permit(:product_id, :item_value, :quantyty, :status)
  end

  def retrieve_order
    order = Order.new
    order.user = current_user
    order
  end

end
