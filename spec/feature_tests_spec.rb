feature 'Feature tests' do
  #   User Story 1.1

  #   As a User;
  #   So that I can be a host and/or a guest;
  #   I want to sign up for MakersBnB.

  scenario 'User Story 1.1. Sign up' do
    visit '/'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'test'
    fill_in :password_confirmation, with: 'test'
    click_button 'Sign Up'
    expect(current_path).to eq '/spaces'
    expect(page).to have_content 'Sign out'
  end

  #   User Story 1.2

  #   As a User;
  #   So that I can book or list a property;
  #   I want to log in to MakersBnB.

  scenario 'User Story 1.2. Log in' do
    User.create(email: 'test@test.com', password: 'test', password_confirmation: 'test' )
    visit '/'
    click_link 'Log In'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'test'
    click_button 'Log In'
    expect(current_path).to eq '/spaces'
    expect(page).to have_content 'Sign out'
  end

end
