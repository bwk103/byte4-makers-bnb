
def signup_with_valid_email
  visit '/'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'test'
  fill_in :password_confirmation, with: 'test'
  click_button 'Sign Up'
end

def login_with_existing_user
  visit '/'
  click_link 'Log In'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'test'
  click_button 'Log In'
end

def login_with_invalid_password
  signup_with_valid_email
  visit '/users/login'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'not_test'
  click_button 'Log In'
end

def create_listing
  signup_with_valid_email
  click_button 'List New Space'
  fill_in(:title, with: 'Casa della Pizza')
  fill_in(:description, with: 'Una casa con la mia pizza preferita, e mi piace.')
  fill_in(:price, with: 89.91)
  fill_in(:start_date, with: '04-07-2017')
  fill_in(:end_date, with: '18-07-2017')
  check('Pet-Friendly')
  check('House')
  click_button('Create Listing')
end

def log_out_and_login_with_another_user
  click_link 'Sign Out'
  click_link 'Log In'
  click_link 'SIGN UP'
  fill_in :email, with: 'test2@test.com'
  fill_in :password, with: 'test'
  fill_in :password_confirmation, with: 'test'
  click_button 'Sign Up'
end

def request_to_book
  create_listing
  log_out_and_login_with_another_user
  click_link 'Book'
  fill_in :text, with: 'I wanna book this!'
  fill_in :date, with: '2017-07-05'
  click_button 'Request to Book'
end

def go_to_confirm_or_deny_form
  request_to_book
  click_link 'Sign Out'
  login_with_existing_user
  visit '/users/requests'
  click_link 'Confirm / deny'
end

def book_an_existing_space
  create_listing
  log_out_and_login_with_another_user
  click_link 'Book'
end
