// 라우팅에 필요한 주소를 추상클래스 필드값으로 선언하여 정리?
abstract class AppRoutes {
  AppRoutes._();
  static const splashScreen = '/splash_screen';
  static const home = '/home';
  static const virtualInvestment = '/virtual_investment';
  static const searchScreen = '/search_screen';
  static const detailInvestment = '/detail_investment';
  static const inputAmountInvestmentScreen = '/input_amount_investment_screen';
  static const investmentProgressScreen = '/investment_progress_screen';
  static const screens = '/screens';
}
