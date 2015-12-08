require 'spec_helper'

describe "pet_types/edit" do
  before(:each) do
    @pet_type = assign(:pet_type, stub_model(PetType,
      :name => "MyString"
    ))
  end

  it "renders the edit pet_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pet_type_path(@pet_type), "post" do
      assert_select "input#pet_type_name[name=?]", "pet_type[name]"
    end
  end
end
