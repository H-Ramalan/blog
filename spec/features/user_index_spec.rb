require 'rails_helper'

RSpec.describe "User Index Page", type: :feature do
    before do
     @user1 = User.create(name: 'Tom', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Europe')
     @user2 = User.create(name: 'Lilly', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from America')
    end

    it "displays the username of all other users" do
    # Write Capybara code to visit the user index page and check for usernames
      visit users_path
      expect(page).to have_content("Name: Tom")
      expect(page).to have_content("Name: Lilly")
    
    end

    it "displays the profile picture for each user" do
      visit users_path
      expect(page).to have_css("img[src*='#{@user1.photo}']")
      expect(page).to have_css("img[src*='#{@user2.photo}']")
    
    end

    it "displays the number of posts each user has written" do
      visit users_path
      expect(page).to have_content("Number of posts: 8")
      expect(page).to have_content("Number of posts: 0")
    end

    it "redirects to a user's show page when clicking on a user" do
      
      click_link("Name: Tom")
      expect(current_path).to eq(user_path(@user1))
    end
end
