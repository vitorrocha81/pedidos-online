require 'rails_helper'

RSpec.describe "products/index.html.erb", type: :view do
  let(:product) { instance_double("Product").as_null_object }
  it "renders index products" do
    product.stub(:product_img) { nil }
    product.stub(:product_category) { instance_double("ProductCategory", name: "nome")}
    product.stub(:to_partial_path) {"products/product"}
    assign(:products, [product, product])
    render
    expect(view).to render_template(partial: "product", :count => 2)
  end
end
