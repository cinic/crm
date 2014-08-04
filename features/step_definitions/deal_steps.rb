Допустим(/^он на странице создания сделки$/) do
  visit new_deal_url
end

Если(/^пользователь отправляет не всю информацию о сделке$/) do
  click_button 'Сохранить'
end

То(/^он снова видит страницу добавления сделки с тайтлом "(.*?)"$/) do |arg1|
  expect(page).to have_title(arg1)
end

Если(/^пользователь отправляет валидную информацию о сделке$/) do
  pending # express the regexp above with the code you wish you had
end
