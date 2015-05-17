require "rails_helper"

describe "routes for Posts", type: :routing do
  it "routes / to the index" do
    expect(get("/")).to route_to("posts#index")
  end

  it "routes /validation_error to posts#validation" do
    expect(get("/validation_error")).to route_to("posts#validation_error")
  end
end
