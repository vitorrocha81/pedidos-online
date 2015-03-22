class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def finish
    @order = Order.find(params[:id])
    @order.status = "finished"
    @order.save
  end
end