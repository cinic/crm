Допустим(/^пользователь на странице добавления заявки$/) do
  visit new_lead_url
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

