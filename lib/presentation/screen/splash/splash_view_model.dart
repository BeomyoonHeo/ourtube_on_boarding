import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/routes/app_routes.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/user_repository.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel(this._userRepository);

  final UserRepository _userRepository;
  final String userNumber = '1';
  final RxInt amount = 0.obs;

  @override
  onReady() async {
    await initUserModel();
    super.onReady();
  }

  Future<void> initUserModel() async {
    _userRepository.getUser(userNumber).forEach((userModel) {
      amount(userModel.amount);
    });
    await Future.delayed(const Duration(
        seconds:
            2)); // 받아올 데이터가 없어서 Splash Screen이 바로 넘어가버려서 일부로 2초 딜레이 후 홈으로 넘어가도록 설정
    Get.offAndToNamed(AppRoutes.screens,
        arguments: {'userNumber': userNumber, 'amount': amount});
  }
}
