Допустим(/^пользователь на странице добавления заявки$/) do
  signin_user
  visit new_lead_url
end

Если(/^пользователь отправляет не всю информацию о заявке$/) do
  click_button 'Сохранить'
end

То(/^он должен видеть сообщение (.*)$/) do |message|
  expect(page).to have_content(message)
end

Если(/^пользователь отправляет валидную информацию о заявке$/) do
  pending # express the regexp above with the code you wish you had
end

То(/^он видит сообщение об успешно добавленой заявке$/) do
  pending # express the regexp above with the code you wish you had
end
