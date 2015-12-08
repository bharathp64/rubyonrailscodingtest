require 'spec_helper'

describe "appointments/new" do
  before(:each) do
    assign(:appointment, stub_model(Appointment,
      :pet_id => 1,
      :user_id => 1,
      :reason => "MyText",
      :doctor_id => 1
    ).as_new_record)
  end

  it "renders new appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", appointments_path, "post" do
      assert_select "input#appointment_pet_id[name=?]", "appointment[pet_id]"
      assert_select "input#appointment_user_id[name=?]", "appointment[user_id]"
      assert_select "textarea#appointment_reason[name=?]", "appointment[reason]"
      assert_select "input#appointment_doctor_id[name=?]", "appointment[doctor_id]"
    end
  end
end
