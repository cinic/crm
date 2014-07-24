Допустим(/^пользователь залогинен$/) do
  signin_user
end

Допустим(/^он на странице создания заявки$/) do
  visit new_lead_url
end

Если(/^пользователь отправляет не всю информацию о заявке$/) do
  click_button 'Сохранить'
end

То(/^он снова видит страницу добавления заявки с тайтлом "(.*)"$/) do |arg1|
  expect(page).to have_title(arg1)
end

Если(/^пользователь отправляет валидную информацию о заявке$/) do
  fill_in "Name",    with: "test test test"
  fill_in "Mobile", with: "+79111234567"
  click_button "Сохранить"
end

То(/^он видит страницу "(.*)" с идентификатором$/) do |arg1|
  expect(page).to have_title(arg1)
end
