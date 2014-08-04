Допустим(/^пользователь имеет аккаунт$/) do
  @user = User.create(name: 'Test Test', email: 'test@test.com', password: 'password', role: 0)
end

Допустим(/^он на странице входа$/) do
  visit login_path
end

Если(/^пользователь отправляет несуществующие данные$/) do
  click_button "Войти"
end

То(/^он должен увидеть сообщение "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Если(/^пользователь отправляет существующие данные$/) do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Войти"
end

То(/^он видит страницу с тайтлом "(.*?)"$/) do |arg1|
  expect(page).to have_title(arg1)
end

То(/^он видит ссылку Выход$/) do
  expect(page).to have_link('', :href => '/logout')
end
