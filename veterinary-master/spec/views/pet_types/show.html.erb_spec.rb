require 'spec_helper'

describe "pet_types/show" do
  before(:each) do
    @pet_type = assign(:pet_type, stub_model(PetType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
