feature 'requests displayed on page' do

  scenario 'Guest can see their requests' do
    create_listing
    log_out_and_login_with_another_user
    click_link 'Book'
    fill_in :text, with: 'I wanna book this!'
    fill_in :date, with: '2017-07-05'
    click_button 'Request to Book'
    within('ul#guest_requests') do
      expect(page).to have_content('Casa della Pizza')
    end
  end

  scenario 'Guest can see their requests' do
    create_listing
    log_out_and_login_with_another_user
    click_link 'Book'
    fill_in :text, with: 'I wanna book this!'
    fill_in :date, with: '2017-07-05'
    click_button 'Request to Book'
    click_link 'Sign Out'
    login_with_existing_user
    visit '/users/requests'
    within('ul#host_requests') do
      expect(page).to have_content('I wanna book this!')
    end
  end
end
