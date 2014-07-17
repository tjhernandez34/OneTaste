require 'spec_helper'

feature "user browsing the website" do

  context "on home page" do

    it "can click a link to a sign in page" do
      visit '/'
      click_on("Login")
      expect(current_path).to eq('/login')
    end

    it "can click a link to a sign up page" do
      visit '/'
      click_on("Create Account")
      expect(current_path).to eq('/users/new')
    end

  end

  context "on login page" do
    let(:user) { User.create(username: "Dummy123", email: "user@example.com", password: 'password') }

    it "can log in" do
      visit '/login'
      within(".login") do
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'password'
      end
      click_button 'Login!'
      expect(current_path).to eq(user_path(user))
    end

  end

  context "on signup page" do
    let(:user) { User.create(username: "Dummy123", email: "user@example.com", password: 'password') }

    it "can sign up" do
      visit '/users/new'
      within(".signup") do
        fill_in 'username', :with => 'Dummy123'
        fill_in 'email', :with => 'user@example.com'
        fill_in 'password', :with => 'password'
      end
      click_button 'Sign Up!'
      expect(current_path).to eq(user_path(user))
    end

  end

  context "on profile page" do
    let(:user) { User.create(username: "Dummy123", email: "user@example.com", password: 'password') }
    let(:review) { Review.create(reviewer_id: user.id, restaurant_id: 1, content: "Great vegan steaks!", title: "Best meat-free options in town") }

    it "can see the restaurants they've reviewed" do
      visit user_path(user)
      expect(page).to have_content 'Best meat-free options in town'
    end

    it "can search restaurants and categories of food" do
      visit user_path(user)
      within(".search") do
        fill_in 'box', :with => 'vegan'
      end
      expect{click_button 'Search'}.to change{current_path}
    end

  end

end
