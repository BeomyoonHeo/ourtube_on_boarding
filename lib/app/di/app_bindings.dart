import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/di/modules/data_modules.dart';
import 'package:ourtube_onboarding_by_milo/app/di/modules/presentation_modules.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/splash/splash_view_model.dart';

/*바인딩 클래스는 State Manage와 Dependency Manage를 라우트에 결합한 클래스로써
동시에 Dependency Injection을 분리한다. / 위젯에서 직접적으로 바인딩 해 줄 필요가 없다.
 */
class AppBindings extends Bindings {
  @override
  void dependencies() {
    PresentationModules.dependencies();
    DataModules.getDependencies();
    Get.put(SplashViewModel(Get.find()));
  }
}
