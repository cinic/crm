module SigninHelpers
  def signin_user
    @current_user = User.create(name: 'Test Test', email: 'test@test.com', password: 'password')

    visit login_path

    fill_in "Email",    with: @current_user.email
    fill_in "Password", with: @current_user.password
    click_button "Войти"
  end
end
World(SigninHelpers)