import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/investment_progress_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/widget/dots_indicator_appbar.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/widget/positioned_elevated_button.dart';

class InvestmentProgressScreen extends BaseScreen<InvestmentProgressViewModel> {
  const InvestmentProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DotsIndicatorAppbar(
          pageController: vm.pageController,
          currentPage: vm.currentPage,
          isLastPage: vm.isLastPage,
          height: 56,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
                controller: vm.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: vm.pages),
            Obx(() => positionedButton(context)),
          ],
        ),
      ),
    );
  }

  Widget positionedButton(BuildContext context) {
    Widget positionedButton;
    switch (vm.currentPage.value.round()) {
      case 0:
        positionedButton = PositionedElevateButton(
            text: '다음',
            onPressed: () {
              vm.nextPage(context);
            });
        break;
      case 1:
        positionedButton = PositionedElevateButton(
          text: '투자하기',
          onPressed: vm.isAvailable.value
              ? () {
                  vm.nextPage(context);
                }
              : null,
        );
        break;
      case 2:
        positionedButton = PositionedElevateButton(
            text: '투자 내역 보기',
            onPressed: () {
              vm.moveDetailInvestmentPage();
            });
        break;
      default:
        positionedButton = PositionedElevateButton(
            text: '나가기',
            onPressed: () {
              Get.back();
            });
    }
    return positionedButton;
  }
}
