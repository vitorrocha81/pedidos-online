class Company < ActiveRecord::Base
  has_one :company_admin
  has_many :products
  has_many :company_ratings
  validates_presence_of :name, :email, :cnpj, :phone, :street_address, :number_address, :city, :neighborhood

  def total_rating()
    unless  company_ratings.nil? do
      company_ratings.calculate(:average, :rating).round(2)
    end
  end
end
end