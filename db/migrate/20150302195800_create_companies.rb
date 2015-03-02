class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :street_address
      t.string :number_address
      t.string :city
      t.string :neighborhood

      t.timestamps null: false
    end
  end
end
