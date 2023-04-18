import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/routes/app_routes.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/user_repository.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/user_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view_model.dart';

class HomeScreenViewModel extends BaseViewModel {
  HomeScreenViewModel({required this.userNumber, required this.repository});
  final UserRepository repository;
  final String userNumber;

  final Rxn<UserModel> user = Rxn<UserModel>();
  final RxList<InvestingChannel> investingChannels = <InvestingChannel>[].obs;
  final RxInt totalProfit = 0.obs;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  void getUser() {
    user.bindStream(repository.getUser(userNumber));

    repository.getUser(userNumber).listen((event) {
      investingChannels([]);

      totalProfit(0);

      investingChannels.addAll(
          event.channels.where((e) => !investingChannels.contains(e)).toList());
      for (var channel in investingChannels) {
        totalProfit(totalProfit.value + channel.totalRevenue.round());
      }
    });
  }

  void moveDetailInvestment() {
    Get.toNamed(AppRoutes.detailInvestment, arguments: investingChannels);
  }

  void userInitialize() {
    repository.userInitialize();
  }
}
