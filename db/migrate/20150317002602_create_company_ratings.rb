class CreateCompanyRatings < ActiveRecord::Migration
  def change
    create_table :company_ratings do |t|
      t.integer :rating

      t.timestamps null: false
    end
  end
end
