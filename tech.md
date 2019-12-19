1. API(Application Programming Interface, 응용 프로그램 프로그래밍 인터페이스)

응용 프로그램에서 사용할 수 있도록, 운영 체제나 프로그래밍 언어가 제공하는 기능을 제어할 수 있게 만든 인터페이스를 뜻한다. 주로 파일 제어, 창 제어, 화상 처리, 문자 제어 등을 위한 인터페이스를 제공한다.
API 제작자는 자신이 가진 데이터베이스 or 기능을 다른 누군가가 쉽게 사용할 수 있도록 모듈화 해서 가지고 있다. 그리고 인증받은 누군가는 단 한 번의 명령으로 해당 데이터 or 기능을 사용할 수 있다.


2. Ajax(Asynchronous JavaScript and XML, 에이잭스)

비동기적인 웹 애플리케이션의 제작을 위해 아래와 같은 조합을 이용하는 웹 개발 기법이다.
기존의 웹 애플리케이션은 브라우저에서 폼을 채우고 이를 웹 서버로 제출(submit)을 하면 하나의 요청으로 웹 서버는 요청된 내용에 따라서 데이터를 가공하여 새로운 웹 페이지를 작성하고 응답으로 되돌려준다. 이때 최초에 폼을 가지고 있던 페이지와 사용자가 이 폼을 채워 결과물로서 되돌려 받은 페이지는 일반적으로 유사한 내용을 가지고 있는 경우가 많다. 결과적으로 중복되는 HTML 코드를 다시 한번 전송을 받음으로써 많은 대역폭을 낭비하게 된다. 대역폭의 낭비는 금전적 손실을 야기할 수 있으며 사용자와 대화(상호 반응)하는 서비스를 만들기 어렵게도 한다.

반면에 Ajax 애플리케이션은 필요한 데이터만을 웹서버에 요청해서 받은 후 클라이언트에서 데이터에 대한 처리를 할 수 있다. 보통 SOAP이나 XML 기반의 웹 서비스 프로토콜이 사용되며, 웹 서버의 응답을 처리하기 위해 클라이언트 쪽에서는 자바스크립트를 쓴다. 웹 서버에서 전적으로 처리되던 데이터 처리의 일부분이 클라이언트 쪽에서 처리 되므로 웹 브라우저와 웹 서버 사이에 교환되는 데이터량과 웹서버의 데이터 처리량도 줄어들기 때문에 애플리케이션의 응답성이 좋아진다. 또한 웹서버의 데이터 처리에 대한 부하를 줄여주는 일이 요청을 주는 수많은 컴퓨터에 대해서 일어나기 때문에 전체적인 웹 서버 처리량도 줄어들게 된다.

장점

- 페이지 이동없이 고속으로 화면을 전환할 수 있다.
- 서버 처리를 기다리지 않고, 비동기 요청이 가능하다.
- 수신하는 데이터 양을 줄일 수 있고, 클라이언트에게 처리를 위임할 수도 있다.


3. 오픈소스, 오픈 API

오픈소스란 프로그램의 틀이라 할수있는 소스가 공개되어 다른사람들이 자유롭게 쓸 수 있도록 한 것을 말합니다. 오픈소스 소프트웨어를 줄여서 OSS라고도 하지요.
소스가 공개되면 자연스레 다른사람들이 그것을 활용하거나 모방할 수도 있는데,
일반적으로 오픈소스가 아닌 경우 이렇게 되면 원작자에게 대가가 지불됩니다.
하지만 오픈소스 소프트웨어는 그 소프트웨어를 쓰는 누구든지 자유롭게 개발과 수정 등에 참여할 수 있게 하는 것입니다.

오픈API는 누구나 사용할 수 있도록 공개된 어플리케이션, 프로그램입니다.
대표적인 것으로 구글맵이 있죠. 별도로 돈을 내거나 하지 않아도 그 프로그램에 쉽게 접속해서 이용할 수 있는 것을 오픈 API라고 합니다. 그외에 스마트폰에서 쓰는 많은 무료 어플도 포함되죠.

다시 말하면 소스가 공개되어 재창조가 가능하게 해 놓은 소프트웨어가 오픈 소스 소프트웨어이고,
누구든지 접근해서 이용할 수 있는 프로그램을 오픈API라고 보면 됩니다.

4. http, https

HTTP = HyperText Transfer Protocol
HTTPS = HyperText Transfer Protocol over Secure sockets layer

SSL(secure sockets layer) 보안 소켓 계층 : 웹서비스를 이용하면서 입력하는 정보들은 모두 서버로 전송된다.
간단한 정보부터 중요한 개인정보까지 모두 서버로 전송되기 때문에 보안이 중요시 되어진다.

http는 보안장치없이 그대로 전송

이러한 문제를 고려해서 http + SSL = https 프로토콜이 생겨남
https에서는 정보들을 전부 암호화해서 전송하기 때문에 http보다 보안성이 더 높다.

https의 경우 암호화롤 인해 http보다 사이트 속도가 조금 느림
-> 평소에는 http이용하다가 로그인, 개인정보 입력과 같은 중요한 정보를 입력하는 페이지에서만 https를 이용한다.

5. 이미지를 저장 => 정해진 경로에 파일이 저장됨(aws s3)등등
-> DB에서 관련 데이터를 삭제하면 이미지도 같이 삭제된다.
어떻게 삭제되는 걸까? `attachment.rb`에서 삭제하는 함수!

```ruby
# Clears out the attachment. Has the same effect as previously assigning
# nil to the attachment. Does NOT save. If you wish to clear AND save,
# use #destroy.

# 첨부 파일을 지웁니다. 첨부 파일에 이전에 0을 할당한 것과 동일한 효과가 있습니다. 저장하지 않습니다. 지우고 저장하려면#destruct(#파괴)를 사용하십시오.
def clear(*styles_to_clear)
	if styles_to_clear.any?
		queue_some_for_delete(*styles_to_clear)
	else
		queue_all_for_delete
		@queued_for_write  = {}
		@errors            = {}
	end
end

# Destroys the attachment. Has the same effect as previously assigning
# nil to the attachment *and saving*. This is permanent. If you wish to
# wipe out the existing attachment but not save, use #clear.
# 첨부 파일을 폐기합니다. 첨부 파일*에 0을 할당하고*저장을 하는 것과 동일한 효과를 보입니다. 이건 영구적인 겁니다 기존 첨부 파일을 지우고 저장하지 않으려면#clear(삭제)를 사용합니다.
    
def destroy
	clear
	save
end

def queue_some_for_delete(*styles)
	@queued_for_delete += styles.uniq.map do |style|
  	path(style) if exists?(style)
	end.compact
end

def queue_all_for_delete #:nodoc:
	return if !file?
	unless @options[:preserve_files]
		@queued_for_delete += [:original, *styles.keys].uniq.map do |style|
			path(style) if exists?(style)
		end.compact
	end
	instance_write(:file_name, nil)
	instance_write(:content_type, nil)
	instance_write(:file_size, nil)
	instance_write(:fingerprint, nil)
	instance_write(:created_at, nil) if has_enabled_but_unset_created_at?
	instance_write(:updated_at, nil)
end
```

6. Trigger(트리거)란?
해당 테이블이나 뷰에 대해 어떤 액션이 가해 졌을때 내가 원하는 액션을 자동으로 처리하는 프로세스

- 주의사항 : 눈에 보이지 않게 자동으로 처리되므로 주의

7. backbone(model, view, collection, router정도의 개념알고가기)
Backbone.js은 클라이언트 사이드 웹애플리케이션 개발에 MVC패턴 적용을 가능하게 해주는 자바스크립트 프레임워크들 중 하나입니다.

Backbone.js를 사용하면 MVC패턴에 맞게 개발을 할 수 있습니다. 즉, M(model, 데이터), V(view, UI), C(controller, 로직, 데이터 처리)로 코드의 역할을 나눠서 작성하고 관리할 수 있게 해줍니다. 프로그램의 구조를 체계화 할 수 있게 됩니다. Backbone.js로 개발을 할 때 다음과 같은 틀에 맞춰 코드를 작성하게 됩니다.

Models – MVC에서의 model입니다. 개별 데이터를 나타냅니다.
Collections – model의 집합입니다. view와 연결되어, model에 변화가 생길 때 손쉽게 view(UI)를 갱신할 수 있습니다.
Routers – MVC에서의 controller 입니다. location.hash의 변경에 따른 처리를 담당합니다.
Views – MVC에서의 view입니다. 화면에 나타나는 UI를 담당하며 프론트엔드의 특성상 view가 controller 의 성격도 가지고 있습니다.


8. 비밀번호 암호화가 어떻게 된건지 : encrypted_password 
	- Bcrypt hash function을 사용해서 암호화 하는 것이다.`https://blog.dexcode.com/decryptable-password-with-devise/`  `devise/lib/devise/encryptor.rb`
	- Bcrypt란??
```
bcrypt
bcrypt는 애초부터 패스워드 저장을 목적으로 설계되었다. Niels Provos와 David Mazières가 1999년 발표했고 현재까지 사용되는 가장 강력한 해시 메커니즘 중 하나이다. bcrypt는 보안에 집착하기로 유명한 OpenBSD에서 기본 암호 인증 메커니즘으로 사용되고 있고 미래에 PBKDF2보다 더 경쟁력이 있다고 여겨진다.

bcrypt에서 "work factor" 인자는 하나의 해시 다이제스트를 생성하는 데 얼마만큼의 처리 과정을 수행할지 결정한다. "work factor"를 조정하는 것만으로 간단하게 시스템의 보안성을 높일 수 있다.

다만 PBKDF2나 scrypt와는 달리 bcrypt는 입력 값으로 72 bytes character를 사용해야 하는 제약이 있다.
```
```
require 'bcrypt'

module Devise
  module Encryptor
    def self.digest(klass, password)
      if klass.pepper.present?
        password = "#{password}#{klass.pepper}"
      end
      ::BCrypt::Password.create(password, cost: klass.stretches).to_s
    end

    def self.compare(klass, hashed_password, password)
      return false if hashed_password.blank?
      bcrypt   = ::BCrypt::Password.new(hashed_password)
      if klass.pepper.present?
        password = "#{password}#{klass.pepper}"
      end
      password = ::BCrypt::Engine.hash_secret(password, bcrypt.salt)
      Devise.secure_compare(password, hashed_password)
    end
  end
end
```


9. imagemagick
이미지매직(ImageMagick)은 그래픽 이미지를 새로 만들거나, 고치는 데 사용되는 자유-오픈 소스 소프트웨어이다. 이미지 매직은 대부분의 이미지 형식을 읽고, 변환하거나 쓸 수 있다. 이미지의 외곽을 자르거나, 색을 바꾸는 것을 비롯한 다양한 효과를 줄 수 있으며, 이미지의 회전, 합치기, 문자삽입, 선, 다각형, 타원, 베지에 곡선을 그려넣거나, 이미지 늘이기 등의 작업을 할 수 있다.

10. devise valiatable에서 메일이랑 비밀번호 확인

11. 캐싱 : 트래픽이 몰리는 서비스에서는 중요함(100번 DB에 접근하는 것보다 한번의 캐싱으로)
```
캐시(cache, 문화어: 캐쉬, 고속완충기, 고속완충기억기)는 컴퓨터 과학에서 데이터나 값을 미리 복사해 놓는 임시 장소를 가리킨다. 캐시는 캐시의 접근 시간에 비해 원래 데이터를 접근하는 시간이 오래 걸리는 경우나 값을 다시 계산하는 시간을 절약하고 싶은 경우에 사용한다. 캐시에 데이터를 미리 복사해 놓으면 계산이나 접근 시간 없이 더 빠른 속도로 데이터에 접근할 수 있다.
```

웹에서는 `사용자 요청->Parser에 의해 aspx분석 -> 컴파일러에 의해 IL 생성 -> Assembly Cache에 저장-> CLR에 의해 실행된 결과가 다시 사용자에게 반환` 의 과정을 거치게된다. 이때 출력 캐싱을 사용하면 모든 과정이 무시되고 출력 캐시에 저장된 내용을 바로 사용자에게 서비스합니다. 페이지 처리과정을 생략할 수 있기때문에 웹사이트의 성능을 높일 수 있다.

- 웹 캐시
웹 캐쉬란 client가 요청하는 html, image, js, css등에 대해 첫 요청 시에 파일을 내려받아 특정 위치에 복사본을 저장(USING SPACE)하고, 이후 동일한 URL의 Resource요청은 다시 내려 받지 않고 내부에 저장한 파일을 사용하여 더 빠르게 서비스(SAVE TIME)하기 위한 것입니다. 서버를 통해 내려 받는 양이 적어지니 응답 시간이 감소하고 네트워크 트레픽이 감소되니 server와 client 모두가 win-win할 수 있는 최고의 tradeoff 인 셈입니다.
	
	- Browser Caches
		- 브라우저 또는 HTTP 요청을 하는 Client Application에 의해 내부 디스크에 캐쉬
		- Cache된 Resource를 공유하지 않는 한 개인에 한정된 Cache
		- 브라우저의 Back버튼 또는 이미 방문한 페이지를 재 방문하는 경우 극대화

	- Proxy Caches
		- Browser Cache와 동일한 원리로 동작, Client나 Server가 아닌 네트워크 상에서 동작
		- 큰회사 or IPS의 방화벽에 설치
		- 대기시간 & 트래픽 감소, 접근정책 & 제한 우회, 사용률 기록등 수행
		- 한정된 수의 클라이언트를 위해 무한대의 웹서버의 컨텐츠를 캐쉬

	- Gateway Caches
		- 서버 앞단에 설치되어 요청에 대한 캐시 및 효율적인 분배를 통해 가용성, 신뢰성, 성능등을 향상
		- Encryption / SSL acceleration, Load balancing, Serve/cache static content , Compression등을 수행
		- 무한대의 클라이언트에게 한정된 수(또는 하나)의 웹서버 컨텐츠를 제공 