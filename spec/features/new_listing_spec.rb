# User Story 2.1
# As a User;
# So that potential guests can see my property;
# I want to be able to list it on MakerBnB and see it listed.

# User Story 4.1
# As a User;
# So that I can better market my property;
# I want to be able to name it as I want.

# User Story 4.2
# As a User;
# So that I can give guests more information;
# I want to be able to include a short description.

# User Story 4.3
# As a User;
# So that the customer knows the price;
# I want to be able to include a price per night.

feature 'Create New Listing' do
  scenario 'A User wants to list Space' do
    visit '/spaces/new'
    fill_in(:title, with: 'Casa della Pizza')
    fill_in(:description, with: 'Una casa con la mia pizza preferita, e mi piace.')
    fill_in(:price, with: 89.91)
    fill_in(:start_date, with: '04/07/2017')
    fill_in(:end_date, with: '08/07/2017')
    click_button('Create Listing')
    expect(page).to have_content('Casa della Pizza')
  end
end
