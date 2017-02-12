feature "Header messages logic" do

  scenario "User can sign up from the login page" do
    visit '/users/login'
    expect(page).to have_content "SIGN UP"
  end

  scenario "When signing out from spaces, user can revisit sign_in page" do
    signup_with_valid_email
    click_link 'Sign Out'
    expect(page).to have_content 'Log In'
  end

  scenario "User receives message when signing in with incorrect password" do
    login_with_invalid_password
    expect(page).to have_content 'The email or password is incorrect!'
  end

  scenario "User cannot book their own space" do
    create_listing
    expect(page).to have_content 'Casa della Pizza'
    expect(page).to have_content 'This is your space!'
  end
end
