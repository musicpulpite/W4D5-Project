require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do
  let(:user) {create :user}
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content('Sign up')
    #consider changing
  end


  feature 'signing up a user' do
    let(:user) {create :user}
    scenario 'shows username on the homepage after signup' do
      sign_up(user)
      expect(page).to have_content(user.username)
    end
  end
end

feature 'logging in', type: :feature do
  let(:user) {create :user}
  scenario 'shows username on the homepage after login' do
    log_in_user(user)
    expect(page).to have_content(user.username)
  end
end

feature 'logging out' do
  let(:user) {create :user}
  scenario 'begins with a logged out state' do
    visit goals_url ###############################
    expect(response).to redirect_to(new_user_url)
  end

  scenario 'doesn\'t show username on the homepage after logout' do

  end
end
