class Product < ActiveRecord::Base
  has_one :company
  validates_presence_of :title, :price, :description
  has_attached_file :product_img, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :product_img, :content_type => /\Aimage\/.*\Z/
end
