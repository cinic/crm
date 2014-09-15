Допустим(/^он на странице создания объекта$/) do
  visit new_apartment_url
end

Если(/^пользователь отправляет не всю информацию об объекте$/) do
  click_button 'Сохранить'
end

То(/^он снова видит страницу добавления объекта с тайтлом "(.*?)"$/) do |arg1|
  expect(page).to have_title(arg1)
end

Если(/^пользователь отправляет валидную информацию об объекте$/) do
  find('#apartment_metro').find(:xpath, 'option[1]').select_option
  fill_in 'Адрес', with: 'ул. Яблочкова, д. 37'
  click_button 'Сохранить'
end