import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/investment_progress_view_model.dart';

class InvestmentProgressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InvestmentProgressViewModel(
          channelRepository: Get.find(),
          userRepository: Get.find(),
          controller: Get.arguments['inputAmount'],
          amount: Get.arguments['amount'],
          channel: Get.arguments['channel'],
        ));
  }
}
