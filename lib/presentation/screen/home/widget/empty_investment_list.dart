import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';

class EmptyInvestmentList extends StatelessWidget {
  const EmptyInvestmentList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/background_cash.svg'),
          const SizedBox(height: 16),
          const Text(
            '투자 내역이 없어요',
            style: title1Bold16,
          ),
        ],
      ),
    );
  }
}
