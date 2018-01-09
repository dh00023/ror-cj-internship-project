# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user
User.create(email: 'wjdekgp1750@naver.com', password: '123456')
User.create(email: 'dh0023@likelion.org', password: '123456')
User.first.add_role 'admin'

# 카테고리
Category.create(name: 'season', priority: 2)
Category.create(name: 'holiday', priority: 1)

date = Date.civil(2018,1,1)
# 2018년 연휴 저장
d=Holidays.year_holidays([:kr],date)

# 연휴 목록 이름 저장
d.each do |dd|
   Banner.create(name: dd[:name], category_id: 2)
end

# 계절 생성
Banner.create(name: 'spring', category_id: 1)
Banner.create(name: 'summer', category_id: 1)
Banner.create(name: 'fall', category_id: 1)
Banner.create(name: 'winter', category_id: 1)