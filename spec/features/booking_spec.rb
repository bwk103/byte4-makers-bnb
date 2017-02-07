# User Story 6.1
# --------------
# As a Guest;
# So that I can make a booking for 1 night;
# I want to be able to send a request to the Host.

feature 'Booking' do
  scenario 'user submit request for a listed space' do
    signup_with_valid_email
    create_listing
    visit '/spaces/1'
    expect(page).to have_content 'Request to book'
    # not the end
  end
end
