class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantyty
      t.integer :item_value

      t.timestamps null: false
    end
  end
end
