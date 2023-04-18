import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/sector.dart';

class PieChartWidget extends StatelessWidget {
  final RxList<Sector> sectors;

  const PieChartWidget({required this.sectors, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chartMarginWidth = MediaQuery.of(context).size.width * 0.2;
    return AspectRatio(
      aspectRatio: 1.0,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: EdgeInsets.only(left: chartMarginWidth),
            height: 142,
            width: 142,
            child: PieChart(
              PieChartData(
                  sections: _chartSections(sectors),
                  centerSpaceRadius: 0.0,
                  sectionsSpace: 0.0,
                  startDegreeOffset: 70.0),
            )),
        Container(
          padding: const EdgeInsets.only(left: 16),
          margin: const EdgeInsets.only(top: 95),
          height: 50,
          width: 90,
          child: Column(
            children: indicatorSection(sectors),
          ),
        ),
      ]),
    );
  }

  List<Widget> indicatorSection(List<Sector> sectors) {
    final List<Widget> widgets = [];

    sectors.forEach((sector) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ColoredBox(
            color: sector.profitType.indicatorColor,
            child: const SizedBox(
              width: 12,
              height: 12,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            sector.profitType.name,
            style: bodyAlertSemiBold12.copyWith(color: const Color(0xFF000000)),
          ),
        ],
      ));
    });
    return widgets;
  }

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (final sector in sectors) {
      const double radius = 70.0;
      final data = PieChartSectionData(
          color: sector.profitType.indicatorColor,
          value: sector.value,
          radius: radius,
          title: '${sector.value.toStringAsFixed(0)}%',
          titleStyle:
              bodyAlertSemiBold12.copyWith(color: const Color(0xFFFFFFFF)));
      list.add(data);
    }
    return list;
  }
}
