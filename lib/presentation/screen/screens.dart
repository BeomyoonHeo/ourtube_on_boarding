import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/common_navigation_bar.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/screens_view_model.dart';

class Screens extends BaseScreen<ScreensViewModel> {
  const Screens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: vm.currentIndex.value,
            children: ScreensViewModel.globalPage,
          )),
      bottomNavigationBar: const CommonNavigationBar(),
    );
  }
}
