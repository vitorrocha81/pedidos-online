class Company < ActiveRecord::Base
  validates_presence_of :name, :email, :cnpj, :phone, :street_address, :number_address, :city, :neighborhood
end