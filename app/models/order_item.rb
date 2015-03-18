class OrderItem < ActiveRecord::Base
  belongs_to :order
  has_many :order_itens
end
