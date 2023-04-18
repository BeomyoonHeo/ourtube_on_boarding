import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/sector.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/detail/widget/pie_chart_widget.dart';
import 'package:ourtube_onboarding_by_milo/utils/format.dart';
import 'package:ourtube_onboarding_by_milo/utils/none_glow_behavior.dart';

class InvestmentInfoTab extends StatelessWidget {
  const InvestmentInfoTab(
      {Key? key,
      required this.totalProfit,
      required this.totalChannelValue,
      required this.totalAdvertisingProfits,
      required this.investingAmount,
      required this.sectors})
      : super(key: key);

  final RxInt totalProfit;
  final RxInt totalChannelValue;
  final RxInt totalAdvertisingProfits;
  final RxInt investingAmount;
  final RxList<Sector> sectors;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoneGlowBehavior(),
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('요약', style: headLine3SemiBold18),
                      const SizedBox(height: 12),
                      buildSummaryTabWidget('투자중인 원금',
                          investingAmount.value.moneyFormat(addFormat: '원')),
                      const SizedBox(height: 12),
                      buildSummaryTabWidget('수익금 총 합',
                          totalProfit.value.moneyFormat(addFormat: '원')),
                      const SizedBox(height: 12),
                      buildSummaryTabWidget(
                          '광고 수익금',
                          totalAdvertisingProfits.value
                              .moneyFormat(addFormat: '원')),
                      const SizedBox(height: 12),
                      buildSummaryTabWidget('채널가치',
                          totalChannelValue.value.moneyFormat(addFormat: '원')),
                    ]),
              ),
              const Divider(
                thickness: 12,
                color: Color(0xFFF6F7F9),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: buildPieChart(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column buildPieChart() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('통계', style: headLine3SemiBold18),
      Obx(() => sectors.isEmpty
          ? Center(
              heightFactor: 15,
              child: Text(
                '내역이 부족하여 분석할 수 없습니다.',
                style: title1Bold16.copyWith(color: const Color(0xFF9FA4B1)),
              ))
          : PieChartWidget(sectors: sectors)),
    ]);
  }

  Widget buildSummaryTabWidget(String text, String summary) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: body1.copyWith(color: const Color(0xFF999EAA)),
        ),
        Text(
          summary,
          style: title2,
        )
      ],
    );
  }
}
