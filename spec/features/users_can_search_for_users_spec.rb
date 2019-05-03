# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Search", type: :feature do
  scenario "A logged in user can see a search box" do
    sign_up
    expect(page).to have_field("user_search")
  end

  scenario "A logged out user cannot see a search box" do
    visit "/"
    expect(page).not_to have_field("user_search")
  end

  scenario "Submitting the search takes you to the results page" do
    sign_up username: "arthur"
    fill_in "user_search", with: "arthur"
    click_button "Go"
    expect(page).to have_content("Search results")
    expect(page).to have_content("arthur")
  end

  scenario "If no search results are returned the user sees a message" do
    sign_up(username: "arthur", email: "user1@gmail.com")
    fill_in "user_search", with: "NonExsistentUser"
    click_button "Go"
    expect(page).to have_content("No users found")
  end

  scenario "Search results that match a username will include the user" do
    sign_up username: "arthur", email: "user1@gmail.com"
    sign_up username: "bob", email: "user2@gmail.com"
    fill_in "user_search", with: "arthur"
    click_button "Go"
    expect(page).to have_content("arthur")
    expect(page).to have_link("arthur")
  end

  scenario "Search results that don't match a username will not include the user" do
    sign_up username: "arthur", email: "user1@gmail.com"
    sign_up username: "bob", email: "user2@gmail.com"
    fill_in "user_search", with: "adasdd"
    click_button "Go"
    expect(page).not_to have_content("arthur")
    expect(page).not_to have_link("arthur")
  end

  scenario "Search a user then visit their page" do
    sign_up username: "arthur", email: "user1@gmail.com"
    create_post on_wall_of: "arthur", message: "Testing"
    sign_up username: "bob", email: "user2@gmail.com"
    fill_in "user_search", with: "arthur"
    click_button "Go"
    click_link "arthur"
    expect(page).to have_content("Testing")
  end

  scenario "Add partial text of a user and return multiple choices that match" do
    sign_up username: "User1", email: "user1@gmail.com"
    sign_up username: "User2", email: "user2@gmail.com"
    sign_up username: "User3", email: "user3@gmail.com"
    fill_in "user_search", with: "User"
    click_button "Go"
    expect(page).to have_content("User1")
    expect(page).to have_content("User2")
    expect(page).to have_content("User3")
  end

  scenario "search a user then post on their page" do
    sign_up username: "arthur", email: "user1@gmail.com"
    sign_up username: "bob", email: "user2@gmail.com"
    fill_in "user_search", with: "arthur"
    click_button "Go"
    click_link "arthur"
    click_link "Create new post"
    fill_in "Message", with: "Testing"
    click_button "Submit"
    expect(page).to have_content("Testing")
  end

  scenario "Search is case insensitive" do
    sign_up username: "UsEr1", email: "user1@gmail.com"
    sign_up username: "uSeR2", email: "user2@gmail.com"
    sign_up username: "uSEr3", email: "user3@gmail.com"
    fill_in "user_search", with: "User"
    click_button "Go"
    expect(page).to have_content("UsEr1")
    expect(page).to have_content("uSeR2")
    expect(page).to have_content("uSEr3")
  end
end
