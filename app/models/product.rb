class Product < ActiveRecord::Base
  belongs_to :company
<<<<<<< HEAD
  has_many :order_itens
=======
  belongs_to :product_category
>>>>>>> f1e3926eecc7c0e6cc05cacc983d50d78e8b97e9
  validates_presence_of :title, :price, :description, :company
  has_attached_file :product_img, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :product_img, :content_type => /\Aimage\/.*\Z/
end
