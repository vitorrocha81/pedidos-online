require 'rails_helper'

RSpec.describe "products/index.html.erb", type: :view do
  it "renders index products" do
    assign(:products, [instance_double("Product").as_null_object])
    render
    expect(view).to render_template(:index, :count => 1)
  end
end