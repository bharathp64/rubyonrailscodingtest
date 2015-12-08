require 'spec_helper'

describe "addresses/new" do
  before(:each) do
    assign(:address, stub_model(Address,
      :street => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", addresses_path, "post" do
      assert_select "input#address_street[name=?]", "address[street]"
      assert_select "input#address_city[name=?]", "address[city]"
      assert_select "input#address_state[name=?]", "address[state]"
      assert_select "input#address_zip[name=?]", "address[zip]"
      assert_select "input#address_user_id[name=?]", "address[user_id]"
    end
  end
end
