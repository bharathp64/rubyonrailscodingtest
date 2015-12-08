require 'spec_helper'

describe "pet_types/index" do
  before(:each) do
    assign(:pet_types, [
      stub_model(PetType,
        :name => "Name"
      ),
      stub_model(PetType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of pet_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
