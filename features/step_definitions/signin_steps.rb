Given(/^a user visits the signin page$/) do
  visit login_path
end

When(/^they submit invalid signin information$/) do
  click_button "Войти"
end

Then(/^they should see an error message$/) do
  expect(page).to have_selector('div.alert')
end

Given(/^the user has an account$/) do
  #user = FactoryGirl.create(:user)
  @user = User.create(name: 'Alexander Andreev', email: 'cinic.rus@gmail.com', password: 'password')
end

When(/^the user submits valid signin information$/) do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Войти"
end

Then(/^they should see dashboard page$/) do
  expect(page).to have_title("Приборная панель")
end

Then(/^they should see a signout link$/) do
  expect(page).to have_link('', :href => '/logout')
end
