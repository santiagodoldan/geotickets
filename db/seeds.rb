# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Pablo Ifran', hours_of_work: 8)
User.create(name: 'Santiago Doldan', hours_of_work: 8)
User.create(name: 'Sebastian Suttner', hours_of_work: 8)
User.create(name: 'Miguel Renom', hours_of_work: 8)
User.create(name: 'Ivan Etchart', hours_of_work: 6)

Tag.create(name: 'Analysis')
Tag.create(name: 'Communication')
Tag.create(name: 'Development')
Tag.create(name: 'Design')
Tag.create(name: 'Management')
Tag.create(name: 'Planning')
Tag.create(name: 'Review')
