feature 'Booking' do

  # User Story 6.1
  # --------------
  # As a Guest;
  # So that I can make a booking for 1 night;
  # I want to be able to send a request to the Host.

  scenario 'User can see the availability on the booking page' do
    book_an_existing_space
    expect(current_path).to have_content '/spaces/'
    expect(page).to have_content 'Available from 04/07/2017 to 18/07/2017'
  end

  scenario 'User can book on an available date' do
    book_an_existing_space
    fill_in :date, with: '2017-07-15'
    click_button 'Request to Book'
    expect(page).to have_content 'Requests you have made'
  end

  scenario 'User can\'t book on an unavailable date' do
    book_an_existing_space
    fill_in :date, with: '2016-07-05'
    click_button 'Request to Book'
    expect(page).to have_content 'Unavailable Date.'
  end

  scenario 'If another user has had booking confirmed for same dates - user cannot book' do
    book_an_existing_space
    fill_in :date, with: '2017-07-05'
    click_button 'Request to Book'
    click_link "Sign Out"
    login_with_existing_user
    click_link "Requests"
    click_link "Confirm / Deny"
    click_button "Confirm"
    click_link "Sign Out"
    click_link 'Log In'
    click_link 'SIGN UP'
    fill_in :email, with: 'bob@test.com'
    fill_in :password, with: 'test'
    fill_in :password_confirmation, with: 'test'
    click_button 'Sign Up'
    click_link 'Book'
    fill_in :date, with: '2017-07-05'
    click_button 'Request to Book'
    expect(page).to have_content 'Unavailable Date.'
  end

#   User Story 7.2
# --------------
# As a Guest;
# So that I can make sure I am booking an available property;
# I want to see on the listing if it is not available.

  scenario 'User can see unavailable dates on the space page' do
    book_an_existing_space
    fill_in :date, with: '2017-07-05'
    click_button 'Request to Book'
    click_link "Sign Out"
    login_with_existing_user
    click_link "Requests"
    click_link "Confirm / Deny"
    click_button "Confirm"
    click_link "Sign Out"
    click_link 'Log In'
    click_link 'SIGN UP'
    fill_in :email, with: 'bob@test.com'
    fill_in :password, with: 'test'
    fill_in :password_confirmation, with: 'test'
    click_button 'Sign Up'
    click_link 'Book'
    expect(page).to have_content('05/07/2017')
  end

  scenario 'User can filter property according to availability on a specific date' do
    book_an_existing_space
    fill_in :date, with: '2017-07-05'
    click_button 'Request to Book'
    click_link "Sign Out"
    login_with_existing_user
    click_link "Requests"
    click_link "Confirm / Deny"
    click_button "Confirm"
    click_link "Sign Out"
    click_link 'Log In'
    click_link 'SIGN UP'
    fill_in :email, with: 'bob@test.com'
    fill_in :password, with: 'test'
    fill_in :password_confirmation, with: 'test'
    click_button 'Sign Up'
    fill_in :selected_date, with: '2017-07-05'
    click_button 'Submit date'
    expect(page).not_to have_content('Casa della Pizza')
  end

end
