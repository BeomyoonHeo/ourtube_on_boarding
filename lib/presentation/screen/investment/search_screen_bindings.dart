import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/search_screen_view_model.dart';

class SearchScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchScreenViewModel(
        repository: Get.find(),
        moveInvestmentProgress: Get.arguments['moveInvestmentProgress']));
  }
}
