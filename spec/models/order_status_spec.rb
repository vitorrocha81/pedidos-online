require 'rails_helper'

describe OrderStatus do
  it "should return a order status when finished" do
    order_status = OrderStatus::FINISHED

    expect(order_status).to be_an(OrderStatus)
  end
  it "should return a order status when finished" do
    order_status = OrderStatus::PENDING

    expect(order_status).to be_an(OrderStatus)
  end
  it "should return a order status when finished" do
    order_status = OrderStatus::PAID

    expect(order_status).to be_an(OrderStatus)
  end

  it "should be equal to a status description" do
    expect(OrderStatus::PAID).to eq "paid"
    expect(OrderStatus::PENDING).to eq "pending"
    expect(OrderStatus::FINISHED).to eq "finished"
  end

  it "should get a order status description" do
    expect(OrderStatus::PENDING.description).to eq "pending"
    expect(OrderStatus::FINISHED.description).to eq "finished"
    expect(OrderStatus::PAID.description).to eq "paid"
  end
end
