require 'spec_helper'

describe "User pages" do

  subject { page }

# COMMENTED OUT BECAUSE I AM SKIPPING A /USERS PAGE FOR NOW
#  describe "index" do

#    let(:user) { FactoryGirl.create(:user) }

#    before(:all) { 30.times { FactoryGirl.create(:user) } }
#    after(:all)  { User.delete_all }

#    it { should have_selector('title', text: 'All users') }
#    it { should have_selector('h1',    text: 'All users') }
    
#    describe "pagination" do
#      it { should have_selector('div.pagination') }

#      it "should list each user" do
#        User.paginate(page: 1).each do |user|
#          page.should have_selector('li>a', text: user.name)
#        end
#      end      
#    end
    
#    describe "delete links" do

#          it { should_not have_link('delete') }

#          describe "as an admin user" do
#            let(:admin) { FactoryGirl.create(:admin) }
#            before do
#              sign_in admin
#              visit users_path
#            end

#            it { should have_link('delete', href: user_path(User.first)) }
#            it "should be able to delete another user" do
#              expect { click_link('delete') }.to change(User, :count).by(-1)
#            end
#            it { should_not have_link('delete', href: user_path(admin)) }
#          end
#        end
#      end
#  end

#  describe "signup page" do
#    before { visit signup_path }

#    it { should have_selector('h1',    text: 'Sign up') }
#    it { should have_selector('title', text: full_title('Sign up')) }
#  end
  
  describe "profile page" do
     let(:user) { FactoryGirl.create(:user) }
     let!(:m1) { FactoryGirl.create(:event, user: user, activity: "Foo1", location: "Bar1") }
     let!(:m2) { FactoryGirl.create(:event, user: user, activity: "Foo2", location: "Bar2") }
  
     before { visit user_path(user) }

     it { should have_selector('h1',    text: user.name) }
     it { should have_selector('title', text: user.name) }  

     describe "events" do
       it { should have_content(m1.activity) }
       it { should have_content(m2.activity) }
       it { should have_content(user.events.count) }
     end
  end
  
  
end