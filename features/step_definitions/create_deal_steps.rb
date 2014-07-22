Допустим(/^пользователь имеет аккаунт$/) do
  @user = User.create(name: 'Test Test', email: 'test@test.com', password: 'password')
end

Допустим(/^пользователь залогинен$/) do
  visit login_url

  fill_in "Email",  with: @user.email
  fill_in "Password",    with: @user.password

  click_button "Войти"
end

Допустим(/^пользователь на странице добавления сделки$/) do
  visit new_deal_url
end

Если(/^пользователь отправляет невалидную информацию$/) do
  pending # express the regexp above with the code you wish you had
end

То(/^он должен видеть сообщение об ошибке$/) do
  pending # express the regexp above with the code you wish you had
end

Если(/^пользователь отправляет валидную информацию$/) do
  pending # express the regexp above with the code you wish you had
end

То(/^он видит сообщение об успешно добавленой сделке$/) do
  pending # express the regexp above with the code you wish you had
end

То(/^он видит информацию по только что созданной сделке$/) do
  pending # express the regexp above with the code you wish you had
end

