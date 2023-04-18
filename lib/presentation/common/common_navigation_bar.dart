import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/screens_view_model.dart';

class CommonNavigationBar extends BaseView<ScreensViewModel> {
  const CommonNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 82, // 타 기종 Device Layout Issue 대응 80 -> 82
          child: BottomNavigationBar(
            onTap: vm.movePage,
            items: [
              BottomNavigationBarItem(
                icon: vm.currentIndex.value == 0
                    ? SvgPicture.asset(
                        'assets/icons/home_icon.svg',
                        color: const Color(0xFF000000),
                      )
                    : SvgPicture.asset('assets/icons/home_icon.svg'),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: vm.currentIndex.value == 1
                    ? SvgPicture.asset(
                        'assets/icons/investment_icon.svg',
                        color: const Color(0xFF000000),
                      )
                    : SvgPicture.asset('assets/icons/investment_icon.svg'),
                label: '모의투자',
              ),
            ],
            currentIndex: vm.currentIndex.value,
            selectedItemColor: const Color(0xff141414),
            selectedLabelStyle:
                alertRegular12.copyWith(color: const Color(0xFF141414)),
            unselectedLabelStyle:
                alertRegular12.copyWith(color: const Color(0xFFC9CCD7)),
          ),
        ));
  }
}
