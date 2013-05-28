require 'spec_helper'

describe Event do

  let(:user) { FactoryGirl.create(:user) }
  before {
    @event = user.events.build(activity: "Lorem ipsum", location: "Lorem ipsum", start_time: "2012-06-29 09:23:04 -0400")  
#    @event = Event.new(activity: "Lorem ipsum", location: "Lorem ipsum", start_time: "2012-06-29 09:23:04 -0400", user_id: user.id)
#    puts @event.errors.message
  }

  subject { @event }

  it { should respond_to(:activity) }
  it { should respond_to(:location) }
  it { should respond_to(:start_time) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }
  
  describe "accessible attributes" do
     it "should not allow access to user_id" do
       expect do
         Event.new(user_id: user.id)
       end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
     end    
  end
   
  describe "when user_id is not present" do
      before { @event.user_id = nil }
      it { should_not be_valid }
  end
  
  describe "with blank activity" do
      before { @event.activity = " " }
      it { should_not be_valid }
  end
  
  describe "with activity that is too long" do
      before { @event.activity = "a" * 501 }
      it { should_not be_valid}
  end
  
  describe "with location that is too long" do
      before { @event.location = "a" * 501 }
      it { should_not be_valid}
  end
end