class Company < ActiveRecord::Base
  has_many :products
  validates_presence_of :name, :email, :cnpj, :phone, :street_address, :number_address, :city, :neighborhood
end