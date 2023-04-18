import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/home/home_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/virtual_investment.dart';

class ScreensViewModel extends BaseViewModel {
  final RxInt currentIndex = 0.obs;
  static List<Widget> globalPage = [
    const HomeScreen(),
    const VirtualInvestmentScreen(),
  ];

  void movePage(int value) {
    currentIndex(value);
  }
}
