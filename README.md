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
7. 배너 CRUD부트스트랩 적용하기
	- scroll적용

- paperclip migration error[https://github.com/thoughtbot/paperclip/issues/2465](https://github.com/thoughtbot/paperclip/issues/2465)

앞으로 적용해야하는 것
1. 배너변경되도록 image url수정