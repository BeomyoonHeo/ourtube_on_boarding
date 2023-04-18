import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/utils/format.dart';

class HeaderDelegate extends StatelessWidget {
  const HeaderDelegate({super.key, required this.investingAmount});
  final RxInt investingAmount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14),
      color: const Color(0xFF026BFB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const Text(
            '투자중인 원금',
            style: body1semiBold14,
          ),
          Obx(() => Text(
                investingAmount.value.moneyFormat(addFormat: '원'),
                style: web3Bold32.copyWith(color: const Color(0xFFFFFFFF)),
              )),
        ],
      ),
    );
  }
}
