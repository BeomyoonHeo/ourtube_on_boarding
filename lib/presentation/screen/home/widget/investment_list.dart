import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';
import 'package:ourtube_onboarding_by_milo/utils/format.dart';
import 'package:ourtube_onboarding_by_milo/utils/none_glow_behavior.dart';

class InvestmentList extends StatelessWidget {
  const InvestmentList(
      {Key? key, required this.investedChannels, required this.totalProfit})
      : super(key: key);
  final RxList<InvestingChannel> investedChannels;
  final RxInt totalProfit;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoneGlowBehavior(),
      child: ListView(cacheExtent: 100, shrinkWrap: true, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7.5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '수익 총합',
                  style: CustomTheme.themeData().textTheme.bodyText2,
                ),
                Obx(() => Text(
                      totalProfit.value.moneyFormat(addFormat: '원'),
                      style: CustomTheme.themeData().textTheme.bodyText2,
                    ))
              ]),
        ),
        const Divider(
          thickness: 1.0,
          indent: 2.0, // 기존 homeScreen의 left margin이 14 이기 때문에 + 2
          endIndent: 16.0,
        ),
        ...investmentChannelList(),
      ]),
    );
  }

  List<Widget> investmentChannelList() {
    final List<Widget> widgetList = <Widget>[];

    for (var channel in investedChannels) {
      widgetList.add(Container(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(1, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(channel.thumbnailUrl)),
            ),
            Expanded(
              child: Text(
                channel.channelTitle,
                style: body2medium14.copyWith(color: const Color(0xFF626C7A)),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                channel.totalProfit().moneyFormat(addFormat: '원'),
                style: title2,
              ),
            )
          ],
        ),
      ));
    }

    return widgetList;
  }
}
