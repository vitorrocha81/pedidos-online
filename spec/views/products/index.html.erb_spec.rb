require 'rails_helper'

RSpec.describe "products/index.html.erb", type: :view do
  let(:product) { instance_double("Product").as_null_object }
  it "renders index products" do
    product.stub(:to_partial_path) {"products/product"}
    assign(:products, [product, product])
    render
    expect(view).to render_template(partial: "_product", :count => 2)
  end
end
