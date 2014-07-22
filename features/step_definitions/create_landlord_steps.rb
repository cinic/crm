Допустим(/^пользователь на странице добавления наймодателя$/) do
  visit new_landlord_url
end
Если(/^пользователь отправляет невалидную информацию$/) do
  click_button "Сохранить"
end
То(/^он видит сообщение об ошибке$/) do
  expect(page).to have_selector('div.alert')
end
Если(/^пользователь отправляет невалидную информацию$/) do
  click_button "Сохранить"
end
То(/^он видит сообщение об успешно добавленном наймодателе$/) do
  pending # express the regexp above with the code you wish you had
end
То(/^он видит информацию по только что созданному наймодателю$/) do
  pending # express the regexp above with the code you wish you had
end