# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Post on wall", type: :feature do
  context "User 2 can post on user 1's wall" do
    before do
      sign_up username: "user1", email: "user1@gmail.com"
      sign_up username: "user2", email: "user2@gmail.com"
      create_post on_wall_of: "user1", message: "Hello user1, from user2"
    end

    scenario "user 2 is redirected to user 1's wall after posting" do
      expect(page).to have_content ("User1's Wall")
    end

    scenario "user 2 can see post on user 1s wall" do
      expect(page).to have_content ("Hello user1, from user2")
    end

    scenario "user 2 can not see post on their own wall" do
      visit "/user2"
      expect(page).not_to have_content ("Hello user1, from user2")
    end
  end

  scenario "The post's author's name links to their wall" do
    sign_up username: "user1", email: "user1@gmail.com"
    sign_up username: "user2", email: "user2@gmail.com"
    create_post on_wall_of: "user1", message: "This is a message"
    click_link "user2"
    expect(page).to have_content "User2's Wall"
  end
end
