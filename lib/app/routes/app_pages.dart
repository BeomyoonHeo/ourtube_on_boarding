import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/routes/app_routes.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/detail/detail_investment.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/detail/detail_investment_bindings.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/home/home_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/search_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/search_screen_bindings.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/virtual_investment.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/virtual_investment_bindings.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/investment_progress_bindings.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/investment_progress_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/screens.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/splash/splash_screen.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(
        name: AppRoutes.detailInvestment,
        page: () => const DetailInvestment(),
        binding: DetailInvestmentBindings()),
    GetPage(
      name: AppRoutes.virtualInvestment,
      page: () => const VirtualInvestmentScreen(),
      binding: VirtualInvestmentBindings(),
    ),
    GetPage(
      name: AppRoutes.investmentProgressScreen,
      page: () => const InvestmentProgressScreen(),
      binding: InvestmentProgressBindings(),
      /*
          Bindings를 통해 해당 ViewModel이 필요한 곳에 ViewModel을 Binding한다.
           */
    ),
    GetPage(name: AppRoutes.screens, page: () => const Screens()),
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(
        name: AppRoutes.searchScreen,
        page: () => const SearchScreen(),
        binding: SearchScreenBindings()),
  ];
}
