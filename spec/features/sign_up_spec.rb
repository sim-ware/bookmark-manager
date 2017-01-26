require 'spec_helper'

feature 'Sign up' do

  scenario 'new sign up' do
    visit '/signup'
    fill_in :email, with: 'eric@example.com'
    fill_in :password, with: 'password1'
    click_button 'Signup'
    expect(page.status_code).to eq 200
    expect { sign_up }.to change(User, :count).by(1)

    within 'p#welcome' do
      expect(page).to have_content('eric@example.com')
    end
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
