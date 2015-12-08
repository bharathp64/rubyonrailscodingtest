require 'spec_helper'

describe "profiles/new" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :user_id => 1,
      :school => "MyString",
      :years_practice => 1
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profiles_path, "post" do
      assert_select "input#profile_user_id[name=?]", "profile[user_id]"
      assert_select "input#profile_school[name=?]", "profile[school]"
      assert_select "input#profile_years_practice[name=?]", "profile[years_practice]"
    end
  end
end
