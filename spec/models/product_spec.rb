require 'rails_helper'

RSpec.describe Product, type: :model do
let(:empresa) { Company.create :name => "Empresa 1", :email => "eu@eu.com", cnpj: "08239505000115", :phone => "11992094490", :street_address => "Rua de casa", :number_address => "86", :city => "sao paulo", :neighborhood => "vila prudente"}
let(:product_params) {{:title => "Produto 1", description: "descrição um, dois tres", price: 133.44, company_id: empresa.id}}    

  describe "has required fields" do
    it "save a valid product" do
      product = Product.new(product_params)
     expect(product).to be_valid
    end
    it "dont save a invalid product" do
     product = Product.new()
     expect(product).to_not be_valid
    end
  end
end