require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe "listing companies on index" do
    it "returns all companies" do
      company1 = Company.create({name: "Empresa 5", email: "eu@eu.com", phone: "1141130853", street_address: "rua gloria", number_address: "86", city: "sao paulo", neighborhood: "vila prudente"}) 
      company2 = Company.create({name: "Empresa 5", email: "eu@eu.com", phone: "1141130853", street_address: "rua gloria", number_address: "86", city: "sao paulo", neighborhood: "vila prudente"}) 
      get :index
      expect(assigns(:companies)).to match_array([company1, company2])
    end
  end    
  
  describe "show a company" do
    it "return same company by id" do
      company = Company.create({name: "Empresa 5", email: "eu@eu.com", phone: "1141130853", street_address: "rua gloria", number_address: "86", city: "sao paulo", neighborhood: "vila prudente"})
      get :show, id: company.id
      expect(assigns(:company)).to eq(company)
    end
  end

  describe "testing create" do
    it "company create" do
      post :create, company: {name: "Empresa Banana", email: "eu@eu.com", phone: "1141130853", street_address: "rua gloria", number_address: "86", city: "sao paulo", neighborhood: "vila prudente"}
      expect(Company.last.name).to eq "Empresa Banana"
      expect(response).to redirect_to action: :show, id: assigns(:company).id 
    end
  end
end