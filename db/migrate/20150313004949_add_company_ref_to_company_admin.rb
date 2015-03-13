class AddCompanyRefToCompanyAdmin < ActiveRecord::Migration
  def change
    add_reference :company_admins, :company, index: true
    add_foreign_key :company_admins, :companies
  end
end
