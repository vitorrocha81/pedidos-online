require 'rails_helper'

RSpec.describe ProductCategory, type: :model do

  describe "create" do
    it "a valid category" do
      category = ProductCategory.new({name: "categoria"})
      expect(category.valid?).to be true
    end
  end

  describe "don't create" do
    it "an invalid category" do
      category = ProductCategory.new
      expect(category.valid?).to be false
    end
  end
end
