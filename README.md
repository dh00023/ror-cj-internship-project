# CJ오쇼핑 인턴 프로젝트

## 주제 / 목표
CJ mall 배너가 하드코딩 되어있는데 이걸 수정!
DB에 조건을 줘서 우선순위로 뜨도록
프론트는 모바일로

- 계절
- 명절(holiday)
- 날씨(명절까지 우선순위하고 할 수 있으면 하기)
- [로그인시 https로 연결하는 것](https://github.com/plataformatec/devise/wiki/How-To:-Use-SSL-(HTTPS))

## 페이지
- index
- Admin
- banner(scaffold로 생성) : CRUD



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