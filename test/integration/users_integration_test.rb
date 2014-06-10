require "test_helper"

class UserTest < Capybara::Rails::TestCase


	describe "User Can Access Home and Login To An Account", :capybara do
    before(:each) do
    visit root_path
  end

	  it "has content" do
      assert page.has_content?("About")
	  end
  
		it "form contains a field called username" do
  		 click_link "login"
  		   assert page.has_content?("Username")
  	end
  
  	it "navigation contains logout link" do
  		click_link "login"
  		 fill_in "Username", with: users(:katie).username
  		 fill_in "user_password", with: users(:katie).password_digest, :match => :prefer_exact
  		 find('#user_password_confirmation').set(users(:katie).password_digest)
        # fill_in "user_confirm_password", with: users(:katie).password_digest, :match => :prefer_exact
  		click_button("Save User")
  		assert page.has_content?("Logout")
  	end
  end
end