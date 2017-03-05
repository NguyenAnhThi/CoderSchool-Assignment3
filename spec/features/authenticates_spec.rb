require 'rails_helper'

RSpec.feature "Authenticates", type: :feature do
  before :each do
    User.create(name: 'name', email: 'user@gmail.com', password: 'password')
  end

  it "log me in" do
    visit new_session_path
    within("#session") do
      fill_in 'email', with: 'user@gmail.com'
      fill_in 'password', with: 'password'
    end
    click_button 'Sign In'
    expect(page).to have_content 'Signed in successfully!'
  end

end
