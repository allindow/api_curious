require 'rails_helper'

RSpec.feature "user logs in with instagram" do
  before do
    setup_for_omniauth
  end
  scenario "they see a welcome message and link to log out" do
    visit '/'
    assert_equal 200, page.status_code
    expect(page).to have_content("Login with Instagram")
    click_link "Login with Instagram"
    expect(current_path).to eq("/")
    expect(page).to have_content("Hello, mockuser.")
    expect(page).to have_button("Logout")
    expect(page).to_not have_content("Login with Instagram")

  end
end
