Допустим(/^он на странице создания наймодателя$/) do
  visit new_landlord_url
end

Если(/^пользователь отправляет не всю информацию о наймодателе$/) do
  click_button 'Сохранить'
end

То(/^он снова видит страницу добавления наймодателя с тайтлом "(.*?)"$/) do |arg1|
  expect(page).to have_title(arg1)
end

Если(/^пользователь отправляет валидную информацию о наймодателе$/) do
  fill_in "ФИО",    with: "test test test"
  fill_in "Мобильный", with: "79111234567"
  click_button "Сохранить"
end