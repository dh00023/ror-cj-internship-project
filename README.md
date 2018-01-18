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

### 1/16

- trigger생성
- recommend모델의 코드 받아와서 ajax url연결
- view랑 모델 연결되게하기
- 프로젝트 완성
- 상품이미지 누르면 실제 CJmall서비스로 연결되도록 하기

알아뒀음 하는 것
- `handlebars`로 하면 javascript에서 간단하게 불러올 수 있고, 관리하기가 쉬워진다.
- 트래픽이 몰리는 서비스에는 캐싱?캐쉬? 관리도 중요하다.
	- 100번 DB에 접근하는 것보다 한번의 캐싱으로
- 비동기방식으로 많이 사용하고 있다.
- 예를 들어, CJ몰 모바엘에서는 스크롤 위치에 따라서 이미지랑 정보뜨도록


앞으로 해야할 일
- 이미지 올리기
- 배너(시즌, 계절)와 관련된 상품코드 한개씩 찾기
- 이미지를 올리고 삭제할 때, 로컬에서 이미지 삭제가 어떤식으로 이루어지는지 알아보기
- http, https차이점 알기
- 비동기(ajax)개념 정리

### 1/17

- 이미지 올리기, 배너 상품코드 찾기
- PPT 만들기

### 1/18

- 피피티 마무리
- 1차대본만들기
- 시연할때 수정할 부분 수정


#### 개념공부

1. **API**(Application Programming Interface, 응용 프로그램 프로그래밍 인터페이스)
```
응용 프로그램에서 사용할 수 있도록, 운영 체제나 프로그래밍 언어가 제공하는 기능을 제어할 수 있게 만든 인터페이스를 뜻한다. 주로 파일 제어, 창 제어, 화상 처리, 문자 제어 등을 위한 인터페이스를 제공한다.
API 제작자는 자신이 가진 데이터베이스 or 기능을 다른 누군가가 쉽게 사용할 수 있도록 모듈화 해서 가지고 있다. 그리고 인증받은 누군가는 단 한 번의 명령으로 해당 데이터 or 기능을 사용할 수 있다.
```

2. **Ajax**(Asynchronous JavaScript and XML, 에이잭스)
```
비동기적인 웹 애플리케이션의 제작을 위해 아래와 같은 조합을 이용하는 웹 개발 기법이다.
기존의 웹 애플리케이션은 브라우저에서 폼을 채우고 이를 웹 서버로 제출(submit)을 하면 하나의 요청으로 웹 서버는 요청된 내용에 따라서 데이터를 가공하여 새로운 웹 페이지를 작성하고 응답으로 되돌려준다. 이때 최초에 폼을 가지고 있던 페이지와 사용자가 이 폼을 채워 결과물로서 되돌려 받은 페이지는 일반적으로 유사한 내용을 가지고 있는 경우가 많다. 결과적으로 중복되는 HTML 코드를 다시 한번 전송을 받음으로써 많은 대역폭을 낭비하게 된다. 대역폭의 낭비는 금전적 손실을 야기할 수 있으며 사용자와 대화(상호 반응)하는 서비스를 만들기 어렵게도 한다.

반면에 Ajax 애플리케이션은 필요한 데이터만을 웹서버에 요청해서 받은 후 클라이언트에서 데이터에 대한 처리를 할 수 있다. 보통 SOAP이나 XML 기반의 웹 서비스 프로토콜이 사용되며, 웹 서버의 응답을 처리하기 위해 클라이언트 쪽에서는 자바스크립트를 쓴다. 웹 서버에서 전적으로 처리되던 데이터 처리의 일부분이 클라이언트 쪽에서 처리 되므로 웹 브라우저와 웹 서버 사이에 교환되는 데이터량과 웹서버의 데이터 처리량도 줄어들기 때문에 애플리케이션의 응답성이 좋아진다. 또한 웹서버의 데이터 처리에 대한 부하를 줄여주는 일이 요청을 주는 수많은 컴퓨터에 대해서 일어나기 때문에 전체적인 웹 서버 처리량도 줄어들게 된다.

장점

- 페이지 이동없이 고속으로 화면을 전환할 수 있다.
- 서버 처리를 기다리지 않고, 비동기 요청이 가능하다.
- 수신하는 데이터 양을 줄일 수 있고, 클라이언트에게 처리를 위임할 수도 있다.
```

3. 오픈소스, 오픈 API
```
오픈소스란 질문자님 말대로 프로그램의 틀이라 할수있는 소스가 공개되어 다른사람들이 자유롭게 쓸 수 있도록 한 것을 말합니다. 오픈소스 소프트웨어를 줄여서 OSS라고도 하지요.

소스가 공개되면 자연스레 다른사람들이 그것을 활용하거나 모방할 수도 있는데,

일반적으로 오픈소스가 아닌 경우 이렇게 되면 원작자에게 대가가 지불됩니다.

하지만 오픈소스 소프트웨어는 

그 소프트웨어를 쓰는 누구든지 자유롭게 개발과 수정 등에 참여할 수 있게 하는 것입니다.

오픈API는 누구나 사용할 수 있도록 공개된 어플리케이션, 프로그램입니다.

대표적인 것으로 구글맵이 있죠. 별도로 돈을 내거나 하지 않아도 그 프로그램에 쉽게 접속해서 이용할 수 있는 것을 오픈 API라고 합니다. 그외에 스마트폰에서 쓰는 많은 무료 어플도 포함되죠.

다시 말하면 소스가 공개되어 재창조가 가능하게 해 놓은 소프트웨어가 오픈 소스 소프트웨어이고,

누구든지 접근해서 이용할 수 있는 프로그램을 오픈API라고 보면 됩니다.
```

