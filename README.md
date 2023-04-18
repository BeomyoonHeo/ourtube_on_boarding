# ourtube_onboarding_by_milo

ourtube youtube Creator Virtual Investment

## 폴더구조

* app
  * config(safe Area, theme 세팅)
    * di(app에 필요한 모듈등의 의존을 세팅)
    * resource(colors, dimensions, font 세팅)
    * routes(app에필요한 페이지와 routes를 세팅)
* data
  * remote(RestApi를 직접적으로 호출하여 Entity를 가지고 있음)
    * datasource
    * dto
  * repository(Entity -> Model로 변환을 담당)
* domain
  * base
  * enums
  * models
  * usecases
* presentation
  * common
  * screen
* utils
  * constants