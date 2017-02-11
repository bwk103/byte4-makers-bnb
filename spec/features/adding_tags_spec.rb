# User Story 4.6
# As a User;
# So that guests can filter my property by features;
# I want to be able to choose tags to my property.

feature 'Adding tags' do

  scenario 'I can add multiple tags to a property' do
    create_listing
    log_out_and_login_with_another_user
    click_link "Book"
    expect(page).to have_content('Pet-friendly')
    expect(page).to have_content('House')
  end

end
