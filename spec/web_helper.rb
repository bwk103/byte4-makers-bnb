
def signup_with_valid_email
  visit '/'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'test'
  fill_in :password_confirmation, with: 'test'
  click_button 'Sign Up'
end

def login_wth_invalid_password
  signup_with_valid_email
  visit '/login'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'not_test'
  click_button 'Log In'
end
