class OrdersController < ApplicationController
  before_action :authenticate_user!, only:  [:create, :new, :finish, :show]
  def show
    @order = Order.find(params[:id])
  end

  def finish
    @order = Order.find(params[:id])
    @order.status = "finished"
    @order.save
  end
end