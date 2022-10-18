
require 'rails_helper'

RSpec.describe 'update a post', type: :system do
  before(:each) do
    @user1 = User.create(:username => "Andrew", :email => "achalkley@example.com") 
    @user2 = User.create(:username => "Matt", :email => "mtardivo@example.com") 

    @post = Post.create(:user => @user1, :title => "My Blog Post", :body => "Hello world!\n\nThis is my first blog post.")
  end

  scenario 'edit author' do
    ###TODO: complete this scenario 100% controller coverage
    ###Ability to change the author from Andrew to Matt
    visit edit_post_path(@post)
    select "Matt", from: "post[user_id]"
    click_button 'Update Post'

    expect(page).to have_content("Post was successfully updated.")
    expect(page).to have_content("By: Matt")
    expect(page).to have_content("This is my first blog post.") 

    expect(Post.count).to eq(1)
  end

  scenario 'empty title and body' do
    visit edit_post_path(@post)
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button 'Update Post'

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")

    expect(Post.count).to eq(1)
  end

  
end
