require 'spec_helper'

describe "pet_types/new" do
  before(:each) do
    assign(:pet_type, stub_model(PetType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new pet_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pet_types_path, "post" do
      assert_select "input#pet_type_name[name=?]", "pet_type[name]"
    end
  end
end
