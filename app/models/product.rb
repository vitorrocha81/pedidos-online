class Product < ActiveRecord::Base
  validades_presence_of :title, :price, :description
end
