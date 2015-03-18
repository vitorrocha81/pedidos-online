class Order < ActiveRecord::Base
  has_many :order_itens

  def add_order_items(order)
    order.line_items.each do |item|
      item.order_id = nil
      line_items << item
    end
  end
end
