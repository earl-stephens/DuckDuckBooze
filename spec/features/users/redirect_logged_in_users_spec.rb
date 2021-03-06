require 'rails_helper'

RSpec.describe "a user who has already logged in", type: :feature do
  before :each do
    @user_11 = User.create(role: 1, enabled: false, name: "Sally Shopper", street: "123 Busy Way", city: "Denver", state: "CO", zip: "80222", email: "sally@gmail.com", password: "12345678")
    @user_21 = User.create(role: 2, enabled: true, name: "Mike Merchant", street: "1 Old Street", city: "Golden", state: "CO", zip: "80403", email: "mike@gmail.com", password: "password")
    @user_31 = User.create(role: 3, enabled: true, name: "Aaron Admin", street: "1 Old Street", city: "Golden", state: "CO", zip: "80403", email: "aaron@gmail.com", password: "password")
  end

  it "registered user goes to profile page" do
    visit login_path

    fill_in :email, with: @user_11.email
    fill_in :password, with: @user_11.password
    click_on "Submit"
    visit login_path

    expect(current_path).to eq(profile_path)
    expect(page).to have_content("You are already logged in.")
  end

  it "merchant goes to dashboard" do
    visit login_path

    fill_in :email, with: @user_21.email
    fill_in :password, with: @user_21.password
    click_on "Submit"

    visit login_path

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("You are already logged in.")
  end

  it "admin goes to root_path" do
    visit login_path

    fill_in :email, with: @user_31.email
    fill_in :password, with: @user_31.password
    click_on "Submit"

    visit login_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You are already logged in.")
  end
end
