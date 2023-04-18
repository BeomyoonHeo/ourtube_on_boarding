import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/investment_progress_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/widget/progress_page_scaffold.dart';
import 'package:ourtube_onboarding_by_milo/utils/format.dart';

class ConfirmInvestmentInfoScreen
    extends BaseScreen<InvestmentProgressViewModel> {
  const ConfirmInvestmentInfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProgressPageScaffold(
      header: _header(),
      title: _title(),
      body: _body(),
    );
  }

  List<Widget> _header() {
    return [
      const SizedBox(height: 22),
      Obx(() => Text(
            '1년동안\n ${vm.totalRevenue.value.moneyFormat(addFormat: '원')}을 받았을 거에요!',
            style: headLine1Bold24.copyWith(
              color: const Color(0xFF141414),
            ),
          )),
    ];
  }

  List<Widget> _title() {
    return [
      const SizedBox(height: 41),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: 62,
          height: 62,
          child: Obx(() => CircleAvatar(
                backgroundImage:
                    NetworkImage(vm.investingChannel.value?.thumbnailUrl ?? ''),
              )),
        ),
        const SizedBox(width: 9),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Text(vm.investingChannel.value?.channelTitle ?? '',
                style: regular18.copyWith(color: const Color(0xFF000000)))),
            Obx(() => Text(
                  '구독자 ${vm.investingChannel.value?.subscriberCount.subscriberFormatter(addFormat: '명')}',
                  style:
                      body1semiBold14.copyWith(color: const Color(0xFF000000)),
                ))
          ],
        ),
      ])
    ];
  }

  List<Widget> _body() {
    return [
      const SizedBox(height: 41),
      Obx(() => RichText(
            text: TextSpan(children: [
              WidgetSpan(
                  child: SizedBox(
                width: 70,
                child: Text('투자 금액',
                    style: body1semiBold14.copyWith(
                        color: const Color(0xFF000000))),
              )),
              TextSpan(
                  text: int.parse(vm.investingChannel.value?.investment ?? '0')
                      .moneyFormat(addFormat: "원"),
                  style:
                      headLine1Bold24.copyWith(color: const Color(0xFF000000))),
            ]),
          )),
      const SizedBox(height: 17),
      Obx(() => RichText(
            text: TextSpan(children: [
              WidgetSpan(
                  child: SizedBox(
                width: 70,
                child: Text('수익금',
                    style: body1semiBold14.copyWith(
                        color: const Color(0xFF000000))),
              )),
              TextSpan(
                  text: vm.totalRevenue.value.moneyFormat(addFormat: "원"),
                  style:
                      headLine1Bold24.copyWith(color: const Color(0xFF000000))),
            ]),
          )),
      const SizedBox(height: 24),
      const Divider(
        thickness: 1,
        color: Color(0xFFF1F2F6),
      ),
      const SizedBox(height: 24),
      Text(
        '상세정보',
        style: headLine3SemiBold18.copyWith(color: const Color(0xFF000000)),
      ),
      const SizedBox(height: 16),
      Text(
        '광고수익금',
        style: body3medium13.copyWith(color: const Color(0xFF000000)),
      ),
      const SizedBox(height: 20),
      _buildNoticeBox('연수익률 +n%'),
      const SizedBox(height: 12),
      Obx(() => Text(vm.adRevenueOfChannel.value.moneyFormat(addFormat: '원'),
          style: title3Bold14.copyWith(color: const Color(0xFF000000)))),
      const SizedBox(height: 18),
      Text(
        '채널가치',
        style: body3medium13.copyWith(color: const Color(0xFF000000)),
      ),
      const SizedBox(height: 16),
      _buildNoticeBox('시세차익+n%'),
      const SizedBox(height: 12),
      Obx(() => RichText(
              text: TextSpan(children: [
            TextSpan(
                text: vm.worthOfChannelBefore.value.moneyFormat(addFormat: '원'),
                style: title3Bold14.copyWith(color: const Color(0xFF000000))),
            TextSpan(
                text: ' --> ',
                style: title3Bold14.copyWith(color: const Color(0xFF000000))),
            TextSpan(
                text: vm.worthOfChannel.value.moneyFormat(addFormat: '원'),
                style: title3Bold14.copyWith(color: const Color(0xFF000000))),
          ]))),
      const SizedBox(height: 100),
    ];
  }

  Container _buildNoticeBox(String text) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFFFF2F6),
          borderRadius: BorderRadius.circular(9)),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Text(
        text,
        style: body3medium13.copyWith(color: const Color(0xFFFF628F)),
      ),
    );
  }
}
