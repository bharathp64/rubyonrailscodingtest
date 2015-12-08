require 'spec_helper'

describe "appointments/edit" do
  before(:each) do
    @appointment = assign(:appointment, stub_model(Appointment,
      :pet_id => 1,
      :user_id => 1,
      :reason => "MyText",
      :doctor_id => 1
    ))
  end

  it "renders the edit appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do
      assert_select "input#appointment_pet_id[name=?]", "appointment[pet_id]"
      assert_select "input#appointment_user_id[name=?]", "appointment[user_id]"
      assert_select "textarea#appointment_reason[name=?]", "appointment[reason]"
      assert_select "input#appointment_doctor_id[name=?]", "appointment[doctor_id]"
    end
  end
end
