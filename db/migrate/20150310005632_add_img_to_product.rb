class AddImgToProduct < ActiveRecord::Migration
  def self.up
    add_attachment :products, :product_img
  end

  def self.down
    remove_attachment :products, :product_img
  end
end
