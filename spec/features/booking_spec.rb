feature 'Booking' do

  # User Story 6.1
  # --------------
  # As a Guest;
  # So that I can make a booking for 1 night;
  # I want to be able to send a request to the Host.

  scenario 'user can see the availability on the booking page' do
    book_an_existing_space
    expect(current_path).to have_content '/spaces/'
    expect(page).to have_content 'Available from: 04/07/2017 to: 08/07/2017'
  end

  # Two tests below seem weird to me - both follow the same path, but one should be for availabkle date, and another should be for non available date.
  scenario 'user can book on an available date' do
    book_an_existing_space
    fill_in :date, with: '2017-07-05'
    click_button 'Request to Book'
    expect(page).to have_content 'Requests you have made:'
  end

  scenario 'user can\'t book on an unavailable date' do
    book_an_existing_space
    fill_in :date, with: '2016-07-05'
    click_button 'Request to Book'
    expect(page).to have_content 'Unavailable Date.'
  end

end

# feature 'Booking' do
#   scenario 'user submit request for a listed space' do
#     create_listing
#     log_out_and_login_with_another_user
#     click_link "Book"
#     expect(current_path).to have_content '/spaces/'
#     click_button 'Request to Book'
#     expect(current_path).to eq '/users/requests'
#     expect(page).to have_content 'Your booking request has been submitted!'
#   end
# end
