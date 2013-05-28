require 'spec_helper'

describe "Event pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "event creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create an event" do
        expect { click_button "Share" }.not_to change(Event, :count)
      end

      describe "error messages" do
        before { click_button "Share" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'event-activity', with: "Lorem ipsum" 
               fill_in 'event-location', with: "Lore ipsum"
        }
      it "should create a event" do
        expect { click_button "Share" }.to change(Event, :count).by(1)
      end
    end
  end
  
  describe "event destruction" do
    before { FactoryGirl.create(:event, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete an event" do
        expect { click_link "delete" }.to change(Event, :count).by(-1)
      end
    end
  end
  
end

def sign_in(user)
#  cookies.permanent[:remember_token] = user.remember_token
  current_user = user
end