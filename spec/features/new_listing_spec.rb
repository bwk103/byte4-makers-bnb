# User Story 2.1
# As a User;
# So that potential guests can see my property;
# I want to be able to list it on MakerBnB and see it listed.

feature 'Create New Listing' do
  scenario 'A User wants to list Space' do
    visit '/listings/new'
    fill_in(:title, with: 'Casa della Pizza')
    fill_in(:description, with: 'Una casa con la mia pizza preferita, e mi piace.')
    fill_in(:price, with: 89.91)
    click_button('Create Listing')
    expect(page).to have_content('Casa della Pizza')
  end
end
