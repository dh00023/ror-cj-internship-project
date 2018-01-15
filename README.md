# CJ오쇼핑 인턴 프로젝트

## 주제 / 목표
CJ mall 배너가 하드코딩 되어있는데 이걸 수정!
DB에 조건을 줘서 우선순위로 뜨도록
프론트는 모바일로

- 계절
- 명절(holiday)
	- [Google holiday](https://github.com/sue445/google_holiday_calendar)
	- [ holidays ](https://github.com/holidays/holidays)
- 날씨(명절까지 우선순위하고 할 수 있으면 하기)
- [로그인시 https로 연결하는 것](https://github.com/plataformatec/devise/wiki/How-To:-Use-SSL-(HTTPS))

## 페이지
- index
- Admin
- banner(scaffold로 생성) : CRUD

## 빌표
- 언어선택이유, 특성 : 짧은 기간내에 좋으 결과물을 내기위해서 익숙한 언어를 사용
- DB설계를 왜이렇게 했는지
- 어떤 오픈소스, 오픈 API 사용했는지
- 이 기능을 구현한 이유


## 모델

1. 기본적인 User model(Admin) -> Devise, cancancan, rolify
	- 그냥 기본적인 모델로!
2. 배너모델(속성은 조금 더 고민)


### 1/4
1. 기본 index페이지(navbar만)
2. Admin속성 -> 배너모델 우선 category로 생성
3. 로그인, 회원가입 페이지만 꾸미기

다음에 해야할 일
1. nav에 underline긋기
2. 뒤로버튼 배치 재설(회원가입, 로그인 페이지)
3. `home/index` 이미지 넣어서 CJ오쇼핑 페이지랑 유사하게 꾸미기
	- 장바구니, 이미지 등등은 실제로 연결은되지않고 보이게

### 1/5
1. 'home/index'페이지 CJ MALL과 유사하게 프론트앤드 구현
2. footer구현
3. DB설계 자료 찾아보기
	- holidays gem(사용할 것임)

- [categorize]
- [order of priority](https://stackoverflow.com/questions/29775500/rails-order-on-columns-values-priority-column)

- 카테고리화 하는 걸로 결정.
	- 계절(봄,여름,가을,겨울)
	- 공휴일(holidays gem)
- 이미지는 없으므로 임의로 설정.
- Admin페이지에서 우선순위 결정 할 수 있도록 설정
- 오늘 날짜가 1순위에 포함이 안되면 2순위 보여주는 것으로.

- 카테고리 1 : N banner
- User(Admin) 1 : N 카테고리

지금까지 자료를 찾아본 결과로는 실시간으로 `date.holiday?`의 결과가 true이면 priority확인해서 true,false로 카테고리 확인하는 방향으로 생각중
category의 priority / holiday여부 둘중에 뭘 먼저 확인하는지에 따라 성능 비교 해본후 결정하는 것도 좋을 것같다.
```
if Time.now.to_date.holiday?
	if category.priority === 0
		where(Time.now.to_date) holiday.image
	else season.image
else season.image
```

### 1/8
[연습프로젝트](https://github.com/dh00023/cj_practice) 생성
1. holiday api
2. category model
3. banner model

이때 날짜는 계속 변동되므로 controller상에서 제어하여 배너에 나오도록
자세한 내용은 연습프로젝트 폴더에서 확인

#### 모델설계 연습
- [계절](https://stackoverflow.com/questions/15414831/ruby-determine-season-fall-winter-spring-or-summer)
- [공휴일](https://github.com/holidays/holidays)


- 모델에 image는 [paperclip](https://github.com/thoughtbot/paperclip) gem사용

- 모델 1:N 관계설정 간단하게 하기(https://stackoverflow.com/questions/17894688/has-many-belongs-to-relation-in-active-record-migration-rails-4)


### 1/9
1. 어제 practice 프로젝트에 적용한 `gem holidays`적용
2. Category우선순위 Admin페이지에서 변경시 다른 것도 자동 Update(`Category.rb`)
3. `home_controller`에서 날짜를 가져올 때, season range생성해서 비교 후 나타나도록 설정
4. Adimin페이지 부트스트랩 적용하기
5. 배너모델에 이미지 넣기([gem `paper clip`](https://github.com/thoughtbot/paperclip))
6. 카테고리모델 nested 배너모델
	- `category/index`에서 배너모델 링크 생성
	- 카테고리별 배너모델 보여주기(`banner/index`)
<!-- 7. 카테고리모델(new, edit) -->
7. 배너 CRUD부트스트랩 적용하기(미완료)

- paperclip migration error[https://github.com/thoughtbot/paperclip/issues/2465](https://github.com/thoughtbot/paperclip/issues/2465)

앞으로 적용해야하는 것
1. 배너변경되도록 image url수정
2. 배너 CRUD부트스트랩 적용하기


### 1/10
1. 배너변경되도록 image url수정
2. 배너 CRUD부트스트랩 적용하기
3. 카테고리 CRUD도 만들기(`new.html.erb`와 `edit.html.erb`가 중요)
	- 카테고리 모델 생성시 priority조건
	- 카테고리 모델 삭제시 priority조건
4. 날씨 api 자료조사
	- 모델(location, 위도, 경도)
	- 뷰(위치를 관리자 페이지에서 변동할 수 있게=>`edit.html.erb`)

	- [openweathermap api](https://openweathermap.org/)사용

```ruby
#https://github.com/coderhs/ruby_open_weather_map
require 'open_weather'
# # get current weather by city name
# OpenWeather::Current.city("Cochin, IN", options)

# # get current weather by city id
# OpenWeather::Current.city_id("1273874", options)

# # get current weather by geocode. (lat, lon)
# OpenWeather::Current.geocode(9.94, 76.26 , options)

# # get current weather for a list of city ids
# OpenWeather::Current.cities([524901, 703448, 2643743], options)

# # get current weather for a bounding box
# OpenWeather::Current.rectangle_zone(12, 32, 15, 37, 10, options)

# # get current weather for cities around a point
# OpenWeather::Current.circle_zone(55.5, 37.5, 10, options)

# By default temperature is returned in fahrenheit to get the current weather in degrees celsius use unit as follows.
# lat위도 lon경도
# 33.4890113,126.49830229999998(제주)
# 35.872536, 128.601767(대구)
# 37.476559,126.98163299999999(사당)
# -18.8873014,47.372773(아프리카)
# -82.862675,134.9947525(남극)

options = { units: "metric", APPID: "ee91ae8a96a41933de679492dd6d7d07" }
options[:lang] = "kr"
a=OpenWeather::Current.geocode(37.544577, 126.97998, options)
puts a
# a.each do |key,value|
# 	puts key, value
# end

# icon http://openweathermap.org/img/w/10d.png

puts a["weather"][0]["icon"]
```

5. 이미지 UI찾기
	- 배너관련 이미지를 찾아서 보내면 적용시켜줄거야

### 1/11

1. 날씨 api 적용하기
	- weather(location, lat:float, lon:float, choose:integer) 모델 생성
	- controller에서 위치에 따른 날씨 아이콘 url
	- admin페이지에서 위치 선택할 수 있도록 하기
	- `home/index`에서 날씨 아이콘 보이도록 설정

2. 추가 프로젝트 과제 : 추천상품 표시하기(CJmall api 사용해서)
	- recommend(code, banner_id) 모델 구현
	- Admin페이지 구성
	- Recommend view(`index`, `edit`, `new`, `_form`)

앞으로 적용해야하는 것(시간 남으면)
- Jquery ajax, Backbone ajax알아보기
- localhost주소 변경하기(대일님이 알려주실 것임)
- api parsing해서 추천상품 뜰 수 있도록
- 이미지를 누르면 바로 CJmall이랑 연결되게!
- 계절별로 기본 선택되는 글씨 색 변경되도록
- checkbox로 추천상품을 사용할 것인지 아닌지! 선택할 수 있도록

### 1/12

[코드카데미 Jquery Ajax](https://www.codecademy.com/courses/javascript-beginner-en-g7vdk/0/1)

- [backbone.js](https://github.com/codebrew/backbone-rails) 구조, 구현방법 공부하기
- [backbone 공부관련 링크](http://codefactory.kr/2011/12/18/backbone-js-require-js-tutorial/)

### 1/15

- cjmall api불러오기(backbone.js)
- localhost주소 변경하기

```
$ cd /etc
$ vi hosts

127.0.0.1 local-display.cjmall.com
127.0.0.1 dev-display.cjmall.com
```
`http://dev-display.cjmall.com:3000/#`로 연결됨.

- view, model js생성해서 연결하기!

앞으로 해야할 것

- 추천상품 이미지 뜨게하기
- view에서 trigger(공부해볼 것)만들기
- recommend 모델에서 Code받아와서 api연결되도록 하기
