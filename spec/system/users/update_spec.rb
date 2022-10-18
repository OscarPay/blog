
require 'rails_helper'

RSpec.describe 'update a user', type: :system do
  before(:each) do
    @user = User.create(:username => "Andrew", :email => "achalkley@example.com") 
  end

  ###TODO: complete this spec 100% controller coverage
  scenario 'empty username and email' do
    visit edit_user_path(@user)
    fill_in "Username", with: ""
    fill_in "Email", with: ""
    click_button 'Update User'

    expect(page).to have_content("Username can't be blank")
    expect(page).to have_content("Email can't be blank")

    expect(User.count).to eq(1)
  end

  scenario 'valid user details' do
    visit edit_user_path(@user)
    fill_in "Username", with: "Matt"
    fill_in "Email", with: "mtardivo@example.com"
    click_button 'Update User'

    expect(page).to have_content("User was successfully updated.")
    expect(page).to have_content("Matt")
    expect(page).to have_content("mtardivo@*******.com")

    expect(User.count).to eq(1)
  end
  
end
