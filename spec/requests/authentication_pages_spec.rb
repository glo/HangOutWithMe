require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in') }
  end
  
  describe "in the Events controller" do

     describe "submitting to the create action" do
       before { post events_path }
       specify { response.should redirect_to(signin_path)}
     end

     describe "submitting to the destroy action" do
       before { delete event_path(FactoryGirl.create(:event)) }
       specify { response.should redirect_to(signin_path) }
     end
   end
end