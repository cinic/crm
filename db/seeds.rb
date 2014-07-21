# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{name: 'Evgeny Savin', email: 'savinru@gmail.com', password: 'password'}, {name: 'Alexander Andreev', email: 'cinic.rus@gmail.com', password: 'password'}, {name: 'Test Test', email: 'test@test.com', password: 'password'}])
