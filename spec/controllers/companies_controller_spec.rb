require 'rails_helper'
RSpec.describe CompaniesController, type: :controller do

  describe "show a company" do
    it "return same company by id" do
      company = Company.create({name: "Empresa 5", email: "eu@eu.com", phone: "1141130853", street_address: "rua gloria", number_address: "86", city: "sao paulo", neighborhood: "vila prudente"})
      get :show, id: company.id
      expect(assigns(:company)).to eq(company)
    end
  end
end