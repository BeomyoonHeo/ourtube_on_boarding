import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/virtual_investment_view_model.dart';

class VirtualInvestmentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VirtualInvestmentViewModel(
        repository: Get.find(), amount: Get.arguments));
  }
}
