feature 'requests displayed on page' do

  scenario 'Guest can see their requests' do
    request_to_book
    within('ul#guest_requests') do
      expect(page).to have_content('Casa della Pizza')
    end
  end

  scenario 'Guest can see their requests' do
    request_to_book
    click_link 'Sign Out'
    login_with_existing_user
    visit '/users/requests'
    within('ul#host_requests') do
      expect(page).to have_content('I wanna book this!')
    end
  end

# User Story 6.2
#
# As a Host;
# So that I can manage bookings;
# I want to be able to approve guests’ requests.

# User Story 8.1
#
# As a Host;
# So that I can manage multiple requests for the same date;
# I want to be able to confirm the booking for the guest of my choice.

  scenario 'User Story 6.2 and 8.1: Host can confirm request' do
    go_to_confirm_or_deny_form
    click_button 'Confirm'
    expect(page).to have_content('Confirmed')
    expect(page).not_to have_content('Not confirmed')
  end

  scenario 'Host can deny request' do
    go_to_confirm_or_deny_form
    click_button 'Deny'
    expect(page).to have_content('Denied')
    expect(page).not_to have_content('Not confirmed')
  end
end
