require 'spec_helper'

feature 'Sign up' do

  scenario 'new sign up' do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'fails if confirmation password doesn\'t match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

end
