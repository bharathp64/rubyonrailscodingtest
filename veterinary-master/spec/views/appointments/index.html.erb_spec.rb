require 'spec_helper'

describe "appointments/index" do
  before(:each) do
    assign(:appointments, [
      stub_model(Appointment,
        :pet_id => 1,
        :user_id => 2,
        :reason => "MyText",
        :doctor_id => 3
      ),
      stub_model(Appointment,
        :pet_id => 1,
        :user_id => 2,
        :reason => "MyText",
        :doctor_id => 3
      )
    ])
  end

  it "renders a list of appointments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
