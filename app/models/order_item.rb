class OrderItem < ActiveRecord::Base
  belongs_to :order
  has_one :product

  def create
  @order_item = current_order
  product = Product.find(params[:product_id])
  @order_idem = @order.add_product(product.id)
  @order_item.product = product
    if @line_item.save
      render show: 'order'
    else
      render show: 'order', notice: "Seu Carrinho Está Vazio"
    end
  end
end
