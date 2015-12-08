require 'spec_helper'

describe "pets/edit" do
  before(:each) do
    @pet = assign(:pet, stub_model(Pet,
      :name => "MyString",
      :breed => "MyString",
      :age => 1,
      :weight => 1,
      :user_id => 1,
      :doctor_id => 1
    ))
  end

  it "renders the edit pet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pet_path(@pet), "post" do
      assert_select "input#pet_name[name=?]", "pet[name]"
      assert_select "input#pet_breed[name=?]", "pet[breed]"
      assert_select "input#pet_age[name=?]", "pet[age]"
      assert_select "input#pet_weight[name=?]", "pet[weight]"
      assert_select "input#pet_user_id[name=?]", "pet[user_id]"
      assert_select "input#pet_doctor_id[name=?]", "pet[doctor_id]"
    end
  end
end
