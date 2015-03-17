class Company < ActiveRecord::Base
  has_one :company_admin
  has_many :products
  has_many :company_rating
  validates_presence_of :name, :email, :cnpj, :phone, :street_address, :number_address, :city, :neighborhood
end