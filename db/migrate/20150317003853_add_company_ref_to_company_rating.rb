class AddCompanyRefToCompanyRating < ActiveRecord::Migration
  def change
    add_reference :company_ratings, :company, index: true
    add_foreign_key :company_ratings, :companies
  end
end
