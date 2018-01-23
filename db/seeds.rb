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
Category.create(name: '공휴일', priority: 1)
Category.create(name: '계절', priority: 2)

date = Date.civil(2018,1,1)
# 2018년 연휴 저장
d=Holidays.year_holidays([:kr],date)

# 연휴 목록 이름 저장
d.each do |dd|
   Banner.create(name: dd[:name], category_id: 1, sdate: dd[:date],edate: dd[:date])
end

Banner.find(4).destroy
Banner.find(12).destroy

# 계절 생성
Banner.create(name: '봄', category_id: 2, sdate: Date.civil(2018,3,1), edate: Date.civil(2018,5,31))
Banner.create(name: '여름', category_id: 2, sdate: Date.civil(2018,6,1), edate: Date.civil(2018,8,31))
Banner.create(name: '가을', category_id: 2, sdate: Date.civil(2018,9,1), edate: Date.civil(2018,11,30))
Banner.create(name: '겨울', category_id: 2, sdate: Date.civil(2017,12,01), edate: Date.civil(2018,2,28))

# 날씨 생성
Weather.create(location: '서울', lat: 37.476559, lon: 126.98163299999999, choose: 1)
Weather.create(location: '제주', lat: 33.4890113,lon: 126.49830229999998, choose: 2)
Weather.create(location: '대구', lat: 35.872536, lon: 128.601767, choose: 3)
Weather.create(location: '아프리카', lat: -18.8873014, lon: 47.372773, choose: 4)
Weather.create(location: '남극',lat: -82.862675, lon: 134.9947525, choose: 5)

# 추천상품 생성
Recommend.create(code: "42473354", banner_id: 1)
Recommend.create(code: "42473354", banner_id: 2)
Recommend.create(code: "42473354", banner_id: 3)
Recommend.create(code: "28983945", banner_id: 5)
Recommend.create(code: "21751778", banner_id: 6)
Recommend.create(code: "37176410", banner_id: 7)
Recommend.create(code: "28983945", banner_id: 8)
Recommend.create(code: "28983945", banner_id: 9)
Recommend.create(code: "42473354", banner_id: 10)
Recommend.create(code: "42473354", banner_id: 11)
Recommend.create(code: "28983945", banner_id: 13)
Recommend.create(code: "45092109", banner_id: 14)
Recommend.create(code: "47666579", banner_id: 15)
Recommend.create(code: "43533979", banner_id: 16)
Recommend.create(code: "45774854", banner_id: 17)
Recommend.create(code: "40813413", banner_id: 18)
Recommend.create(code: "42201493", banner_id: 19)
