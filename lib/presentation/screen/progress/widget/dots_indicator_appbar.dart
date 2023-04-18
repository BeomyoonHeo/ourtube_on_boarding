import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotsIndicatorAppbar extends StatelessWidget with PreferredSizeWidget {
  const DotsIndicatorAppbar(
      {Key? key,
      this.height = 48,
      required this.pageController,
      required this.currentPage,
      required this.isLastPage})
      : super(key: key);

  final PageController pageController;
  final double height;
  final RxDouble currentPage;
  final RxBool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top + 10,
          left: 24,
          right: 24),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Obx(() => isLastPage.value
            ? const SizedBox()
            : InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Color(0xFF4A4D57)),
              )),
        Obx(() {
          return DotsIndicator(
            dotsCount: 3,
            onTap: movePage,
            position: currentPage.value,
            decorator: DotsDecorator(
              size: const Size.square(7.0),
              color: const Color(0xFFDCDEE5),
              activeSize: const Size(15.0, 7.0),
              activeColor: const Color(0xFF026BFB),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          );
        }),
      ]),
    );
  }

  void movePage(double position) {
    pageController.jumpToPage(position.round());
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
