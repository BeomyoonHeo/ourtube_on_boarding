import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/detail/detail_investment_view_model.dart';

class DetailInvestmentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => DetailInvestmentViewModel(investingChannels: Get.arguments));
  }
}
