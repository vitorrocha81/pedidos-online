class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.string :shipping
      t.string :payment_method
      t.float :total_value

      t.timestamps null: false
    end
  end
end
