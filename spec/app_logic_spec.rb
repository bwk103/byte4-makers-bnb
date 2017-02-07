feature "header messages logic" do

  scenario "user can sign up from the login page" do
    visit '/login'
    expect(page).to have_content "Sign Up"
  end

  scenario "when signing out from spaces, user can revisit signin" do
    signup_with_valid_email
    click_link 'Sign Out'
    expect(page).to have_content 'Log In'
  end
end
