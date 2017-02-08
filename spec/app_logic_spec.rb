feature "header messages logic" do

  scenario "user can sign up from the login page" do
    visit '/users/login'
    expect(page).to have_content "Sign Up"
  end

  scenario "when signing out from spaces, user can revisit sign_in page" do
    signup_with_valid_email
    click_link 'Sign Out'
    expect(page).to have_content 'Log In'
  end

  scenario "user receives message when signing in with incorrect password" do
    login_wth_invalid_password
    expect(page).to have_content 'The email or password is incorrect!'
  end
end
