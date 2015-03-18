class Order < ActiveRecord::Base
  has_many :order_itens

  def add_order_items(order)
    order.order_itens.each do |item|
      item.order_id = nil
      order_itens_itens << item
    end
  end
end
