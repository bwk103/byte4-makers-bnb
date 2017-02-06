describe User do
  let!(:user) do
    User.create(email: 'testtest@test.com', password: 'qwerty', password_confirmation: 'qwerty')
  end

  it 'authenticates when given a valid email address and password' do
    auth_user = User.authenticate(user.email, 'qwerty')
    expect(auth_user).to eq(user)
  end

  it 'does not authenticate when given an invalid username and password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
