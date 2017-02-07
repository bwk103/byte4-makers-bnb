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
    signup_with_valid_email
    create_listing
    expect(page).to have_content('Casa della Pizza')
  end
end
