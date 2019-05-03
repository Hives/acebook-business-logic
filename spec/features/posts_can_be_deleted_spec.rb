# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Deleting posts", type: :feature do
  context "When looking at your own wall" do
    scenario "A 'remove' link should appear on your own post" do
      sign_up username: "user"
      create_post on_wall_of: "user"
      expect(page).to have_link("Remove")
    end

    scenario "A 'remove' link should not appear on someone else's post" do
      sign_up username: "user1", email: "user1@gmail.com"
      sign_up username: "user2", email: "user2@gmail.com"
      create_post on_wall_of: "user1"
      log_in email: "user1@gmail.com"
      expect(page).not_to have_link("Remove")
    end
  end

  context "When looking at someone else's wall" do
    scenario "A 'remove' link should appear on your own post" do
      sign_up username: "user1", email: "user1@gmail.com"
      sign_up username: "user2", email: "user2@gmail.com"
      create_post on_wall_of: "user1"
      expect(page).to have_link("Remove")
    end

    scenario "A 'remove' link should not appear on someone else's post" do
      sign_up username: "user1", email: "user1@gmail.com"
      create_post on_wall_of: "user1"
      sign_up username: "user2", email: "user2@gmail.com"
      visit "/user1"
      expect(page).not_to have_link("Remove")
    end
  end

  context "When a user clicks 'delete' on their post" do
    before do
      sign_up username: "user1", email: "user1@gmail.com"
      create_post on_wall_of: "user1"
      expect(page).to have_content("Hello m0m")
      click_link("Remove")
    end

    scenario "The post gets deleted" do
      expect(page).not_to have_content("Hello m0m")
    end

    scenario "A confirmation message gets displayed" do
      expect(page).to have_content("Post deleted")
    end
  end
end
