import 'package:flutter/material.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';

class GrowthValueWidget extends StatelessWidget {
  const GrowthValueWidget(
      {Key? key, required this.count, required this.countYearAgo})
      : super(key: key);

  final Color backgroundUpColor = const Color(0xFFFFF2F6);
  final Color backgroundDownColor = const Color(0xFFF2F5FF);

  final int count;
  final int countYearAgo;
  @override
  Widget build(BuildContext context) {
    double growth = double.parse(
        ((count - countYearAgo) / countYearAgo * 100).toStringAsFixed(2));
    bool isGrowth = growth >= 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      color: isGrowth ? backgroundUpColor : backgroundDownColor,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: '$growth% ',
              style: isGrowth
                  ? body3medium13.copyWith(color: const Color(0xFFFF628F))
                  : body3medium13.copyWith(color: const Color(0xFF0078D4))),
          isGrowth
              ? const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    Icons.arrow_upward,
                    color: Color(0xFFFF628F),
                    size: 16,
                  ),
                )
              : const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(Icons.arrow_downward, color: Color(0xFF0078D4))),
        ]),
      ),
    );
  }
}
