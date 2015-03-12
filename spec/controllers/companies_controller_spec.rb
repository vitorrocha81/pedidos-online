require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe "listing companies on index" do
    it "returns all companies" do
      company1 = Company.create({name: "Empresa 5", email: "eu@eu.com", cnpj: "08239505000115", phone: "1141130853", street_address: "rua gloria", number_address: "86", city: "sao paulo", neighborhood: "vila prudente"}) 
      company2 = Company.create({name: "Empresa 5", email: "eu@eu.com", cnpj: "08239505000116", phone: "1141130853", street_address: "rua gloria", number_address: "86", city: "sao paulo", neighborhood: "vila prudente"}) 
      get :index
      expect(assigns(:companies)).to match_array([company1, company2])
    end
  end    
  
  describe "show a company" do
    it "return same company by id" do
      company = Company.create({name: "Empresa 5", email: "eu@eu.com", cnpj: "08239505000115", phone: "1141130853", street_address: "rua gloria", number_address: "86", city: "sao paulo", neighborhood: "vila prudente"})
      get :show, id: company.id
      expect(assigns(:company)).to eq(company)
    end
  end

  describe "testing create" do
    it "company create" do
      @request.env["devise.mapping"] = Devise.mappings[:company_admin]
      @company_admin = CompanyAdmin.create!({email: "empresa@empresa.com", password:"12345678"})
      sign_in :company_admin, @company_admin
      post :create, company: {name: "Empresa 1", email: "eu@eu.com", cnpj: "08239505000115", phone: "1141130853", street_address: "rua gloria", number_address: "86", city: "sao paulo", neighborhood: "vila prudente"}
      expect(response).to redirect_to Company.last
      expect(Company.last.name).to eq "Empresa 1"
    end
  end

  describe "testing companies controller" do
    it "#update" do
      @request.env["devise.mapping"] = Devise.mappings[:company_admin]
      @company_admin = CompanyAdmin.create!({email: "vitor@eu.com", password:"12345678"})
      sign_in :company_admin, @company_admin
      company = Company.create({name: "Empresa 5", email: "enoresa@empresa.com", cnpj: "08239505000115", phone: "1141130853", street_address: "rua gloria", number_address: "86", city: "sao paulo", neighborhood: "vila prudente"})
      put :update, id: company.id, company: {name: "Empresa 5 Atualizada"}
      expect(Company.find(company.id).name).to eq "Empresa 5 Atualizada"
    end
  end
end