require 'rails_helper'
RSpec.describe "products/index.html.erb", type: :view do
  let(:product) { instance_double("Product").as_null_object }
  it "renders index products" do
    allow(product).to receive(:product_img).and_return(nil)
    allow(product).to receive(:product_category).
      and_return(instance_double("ProductCategory", name: "nome"))
    allow(product).to receive(:to_partial_path).and_return("products/product")
    assign(:products, [product, product])
    render
    expect(view).to render_template(partial: "_product", :count => 2)
  end
end