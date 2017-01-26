
def sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
      fill_in :email, with: 'eric@example.com'
      fill_in :password, with: 'password1'
      click_button 'Signup'
end
