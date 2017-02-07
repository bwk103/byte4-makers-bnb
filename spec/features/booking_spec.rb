# User Story 6.1
# --------------
# As a Guest;
# So that I can make a booking for 1 night;
# I want to be able to send a request to the Host.

feature 'Booking' do
  scenario 'user submit request for a listed space' do
    signup_with_valid_email
    create_listing
    click_link "Book"
    expect(current_path).to eq '/spaces/1'
    click_button 'Request to Book'
    expect(current_path).to eq '/requests'
    expect(page).to have_content 'Your booking request has been submitted!'
  end
end
