import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/home/home_screen_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/virtual_investment_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/screens_view_model.dart';

/*
Get arguments를 통해 Get.toNamed 메서드에서 상태를 넘길때 dynamicType으로 전달한다.
Model에서 파싱해주는 메서드 생성해야한다. dynamic -> 해당 모델 타입으로 변경진행
ViewModel에서 해당 메서드를 호출한다.
 */
abstract class PresentationModules {
  PresentationModules._();

  static void dependencies() {
    Get.lazyPut(() => HomeScreenViewModel(
        userNumber: Get.arguments['userNumber'], repository: Get.find()));
    Get.lazyPut(() => VirtualInvestmentViewModel(
        amount: Get.arguments['amount'], repository: Get.find()));
    Get.lazyPut(() => ScreensViewModel());
    /*
    fenix: true로 해놓으면 Getx에서 재사용하기 위해 메모리에 남겨둔다. - 자주 사용하는 페이지에선 true로 적용하기
    false상태에선 Route에서 pop 했을때 메모리에서 완전히 제거되기 때문에 다시 호출할려면 일일히 put을 재진행 해줘야한다.
     */
    /*
    ViewModel에선 fenix:true 가급적이면 금지! -> LifeCycle에서 OnInit을 해줄 수 없을 뿐더러 사용자가 사용하지 않는 화면임에도
    불구하고 메모리에 남겨져 있기 때문이다. 굳이 사용한다면 DomainLayer에서 사용하기
    why? 해당 데이터는 ApiCall을 통해서 가져온 데이터이기 때문에 fenix:false로 인해 참조하지 않는 데이터이더라도 날려버린다면 다시
    ApiCall을 진행해야하기 때문에 DataResource가 많이 들어가기 때문이다.
     */
  }
}
