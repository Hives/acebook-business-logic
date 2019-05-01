# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Deleting posts", type: :feature do
  scenario "A 'delete' link should appear on a user's post" do
    sign_up
    create_post
    expect(page).to have_link("Remove")
  end

  scenario "An 'delete' link should not appear on a different user's post" do
    sign_up email: "user1@gmail.com"
    create_post
    sign_up email: "user2@gmail.com"
    visit "/posts"
    expect(page).not_to have_link("Remove")
  end

  context "When a user clicks 'delete' on their post" do
    before do
      sign_up email: "user1@gmail.com"
      create_post
      expect(page).to have_content("Hello m0m")
      click_link('Remove')
    end

    scenario "The post gets deleted" do
      expect(page).not_to have_content("Hello m0m")
    end

    scenario "A confirmation message gets displayed" do
      expect(page).to have_content("Post deleted")
    end
  end
end
