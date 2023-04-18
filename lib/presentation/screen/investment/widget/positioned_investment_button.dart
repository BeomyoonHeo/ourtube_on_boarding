import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';

class PositionedInvestmentButton extends StatelessWidget {
  const PositionedInvestmentButton({
    Key? key,
    required this.selectedIndex,
    required this.height,
    required this.width,
    required this.channels,
    required this.moveInvestmentProgress,
  }) : super(key: key);

  final Rxn<int> selectedIndex;
  final double height;
  final double width;
  final RxList<Channel>? channels;
  final Function moveInvestmentProgress;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: width,
        height: height,
        bottom: 5,
        child: Obx(() => AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: selectedIndex.value != null ? 1.0 : 0.0,
              child: Visibility(
                visible: selectedIndex.value != null,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    minimumSize: const Size.fromWidth(0),
                    backgroundColor: const Color(0xFF026BFB),
                  ),
                  onPressed: () {
                    moveInvestmentProgress(channels, selectedIndex);
                  },
                  child: Text(
                    '투자하기',
                    style: regular16.copyWith(color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            )));
  }
}
