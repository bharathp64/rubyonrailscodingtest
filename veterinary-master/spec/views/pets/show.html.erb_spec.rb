require 'spec_helper'

describe "pets/show" do
  before(:each) do
    @pet = assign(:pet, stub_model(Pet,
      :name => "Name",
      :breed => "Breed",
      :age => 1,
      :weight => 2,
      :user_id => 3,
      :doctor_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Breed/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
