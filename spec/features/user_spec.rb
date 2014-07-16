require 'spec_helper'

feature "user browsing the website" do

  context "on home page" do

    it "can click a link to a sign in page" do
      visit '/'
      click_on("Sign in")
      expect(current_path).to eq('/signin')
    end

    it "can click a link to a sign up page" do
      visit '/'
      click_on("Sign up")
      expect(current_path).to eq('/signup')
    end

  end

  context "on login page" do
    let(:user) { username: "Dummy123", email: "user@example.com", password: 'password' }

    within(".login") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    expect(current_path).to eq(user_path(user))
  end

  context "on signup page" do
    let(:user) { username: "Dummy123", email: "user@example.com", password: 'password' }

    within(".signup") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Username', :with => 'Dummy123'
    end
    click_button 'Sign up'
    expect(current_path).to eq(user_path(user))
  end

  context "on profile page" do
    let(:user) { username: "Dummy123", email: "user@example.com", password: 'password' }
    let(:review) { reviewer_id: user.id, restaurant_id: 1, content: "Great vegan steaks!", title: "Best meat-free options in town" }

    it "can see the restaurants they've reviewed" do
      visit user_path(user)
      expect(page).to have_content 'Best meat-free options in town'
    end

    it "can search restaurants and categories of food" do
      visit user_path(user)
      within(".search") do
        fill_in 'Search', :with => 'vegan'
      end
      expect{click_button 'Search'}.to change{page}
    end
  end

end
