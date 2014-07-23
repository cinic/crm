module SigninHelpers
  def signin_user
    @current_user = User.create(name: 'Test Test', email: 'test@test.com', password: 'password')
  end
end
World(SigninHelpers)