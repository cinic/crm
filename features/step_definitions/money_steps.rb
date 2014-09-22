Допустим(/^он на странице "(.*?)"$/) do |arg1|
  visit arg1
end

Если(/^в базе данных присутствуют записи о поступлениях или списаниях денег$/) do
  status = Money::Status.create(FactoryGirl.attributes_for(:money_status))
  category = Money::Category.create(FactoryGirl.attributes_for(:money_category))
  debit = Money::Debit.create(FactoryGirl.attributes_for(:money_debit, category: category, status: status))
  credit = Money::Credit.create(FactoryGirl.attributes_for(:money_credit, category: category, status: status))
  @money = Money::Operation.all
end

То(/^пользователь видит список поступлений и списаний$/) do
  expect(@money.count).to eq(2)
end

То(/^он видит контрагента, категорию операции, дату операции, её сумму, а также её статус$/) do
  expect(page).to have_content(@money.first.contractor)
  expect(page).to have_content(@money.first.category.description)
end
