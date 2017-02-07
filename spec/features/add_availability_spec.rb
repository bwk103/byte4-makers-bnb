# User Story 5.1
#
# As a Host
# So that I can tell guests when the property is available
# I want to be able to state the available dates.

feature 'Add space availability' do
  scenario 'Host wants to state available dates for the space' do
    new_listing
    fill_in(:start_date, with: '04/07/2017')
    fill_in(:end_date, with: '08/07/2017')
    click_button('Create Listing')
    expect(page).to have_content('Available from 04/07/2017 to 08/07/2017')
  end

end
