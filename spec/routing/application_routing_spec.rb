require "rails_helper"

RSpec.describe "Routing to the application", :type => :routing do
  # it "GET / routes to ??????"

  it "routes GET / to games#index " do
    expect(:get => "/").to route_to("games#index")
  end
end
