Допустим(/^пользователь на странице входа$/) do
  visit login_path
end
Допустим(/^пользователь имеет аккаунт$/) do
  @user = User.create(name: 'Test Test', email: 'test@test.com', password: 'password')
end
Если(/^он отправляет невалидную информацию$/) do
  click_button "Войти"
end

То(/^он видит сообщение об ошибке$/) do
  expect(page).to have_selector('div.alert')
end

Если(/^пользователь отправляет валидную информацию$/) do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Войти"
end

То(/^он видит страницу Дашбоард$/) do
  expect(page).to have_title("Приборная панель")
end

То(/^он видит ссылку Выход$/) do
  expect(page).to have_link('', :href => '/logout')
end
