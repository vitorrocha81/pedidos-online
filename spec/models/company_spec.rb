require 'rails_helper'
 
RSpec.describe Company, type: :model do
let(:company_params) {{:name => "Empresa 1", :email => "eu@eu.com", :phone => "11992094490", :street_address => "Rua de casa", :number_address => "86", :city => "sao paulo", :neighborhood => "vila prudente"}}

  describe "has required fields" do
    it "company saved" do
      company = Company.create(company_params)
      expect(company.persisted?).to eq(true)
    end
    it "company not saved" do
      company = Company.create({:phone => "11992094490", :street_address => "Rua de casa", :number_address => "86", :city => "sao paulo", :neighborhood => "vila prudente"})
      expect(company.persisted?).to eq(false)    
    end
  end
end

