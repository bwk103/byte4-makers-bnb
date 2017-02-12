# User Story 5.1
#
# As a Host
# So that I can tell guests when the property is available
# I want to be able to state the available dates.

feature 'Add space availability' do
  scenario 'Host wants to state available dates for the space' do
    create_listing
    expect(page).to have_content('Available from 04/07/2017 to 18/07/2017')
  end

end
