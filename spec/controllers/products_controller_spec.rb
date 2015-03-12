require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:empresa) { Company.create :name => "Empresa 1", :email => "eu@eu.com", cnpj: "08239505000115", :phone => "11992094490", :street_address => "Rua de casa", :number_address => "86", :city => "sao paulo", :neighborhood => "vila prudente"}
  let(:product) {{:title => "Produto 1", description: "descrição um, dois tres", price: 133.44, company_id: empresa.id}}    

  describe "GET #index" do
    it "list last created products" do
      product1 = Product.create(product)    
      product2 = Product.create(product)
      get :index
      expect(assigns(:products)).to match_array([product1, product2])   
    end
  end

  describe "POST #create" do
    it "create a new product" do
      admin = CompanyAdmin.create!(email: "123@eu.com", password: "12345678")
      sign_in admin
      post :create, product: product
      expect(response).to redirect_to Product.last       
    end
  end

  describe "#edit a Product" do
    it "edit a product with success" do
      admin = CompanyAdmin.create!(email: "123@eu.com", password: "12345678")
      sign_in admin
      product3 = Product.create!({:title => "Produto 2", description: "descrição um, dois tres", price: 133.44, company_id: empresa.id })    
      put :update, id: product3.id, product: {title: "Produto ATUALIZADO" }
      expect(Product.find(product3.id).title).to eq "Produto ATUALIZADO"
    end
  end

  describe "GET #show" do
    it "returns a valid product" do
      product1 = Product.create(product)
      get :show, id: product1.id
      expect(response).to have_http_status(:success)
      expect(assigns(:product)).to eq(product1)
    end
  end
end