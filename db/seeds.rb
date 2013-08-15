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

sprint_1 = Sprint.create(display_name: 'Sprint 1', status: 1, start_date: 2.weeks.ago, end_date: 1.day.ago)

story_1_1 = Story.create(display_name: 'B-01769 Add sprint model')
story_1_2 = Story.create(display_name: 'B-01770 Apply css styles')

sprint_1.stories << story_1_1
sprint_1.stories << story_1_2

sprint_2 = Sprint.create(display_name: 'Sprint 2', status: 0, start_date: Date.today, end_date: 2.weeks.from_now)

story_2_1 = Story.create(display_name: 'B-01788 Create report view')
story_2_2 = Story.create(display_name: 'B-01790 Apply Sprint context')

sprint_2.stories << story_2_1
sprint_2.stories << story_2_2
