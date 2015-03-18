class OrdersController < ApplicationController
  
  def new
    if @order.order_itens.empty?
      redirect_to orders_new_path, notice: "Seu Carrinho Está Vazio"
    else
     @order = Order.find(params[:id])
    end
  end

  def create
  end

  def show
    @order = Order.find(params[:id])
  end
end
