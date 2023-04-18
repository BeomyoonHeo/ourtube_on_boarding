import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/investment_progress_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/widget/growth_value_widget.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/widget/progress_page_scaffold.dart';
import 'package:ourtube_onboarding_by_milo/utils/format.dart';

class ConfirmChannelInfoScreen extends BaseScreen<InvestmentProgressViewModel> {
  const ConfirmChannelInfoScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProgressPageScaffold(
      header: _header(),
      title: _title(context),
      body: _body(),
    );
  }

  List<Widget> _header() {
    return [
      const SizedBox(height: 22),
      Text(
        '채널 정보를\n확인해주세요',
        style: headLine1Bold24.copyWith(
          color: const Color(0xFF141414),
        ),
      ),
      const SizedBox(height: 42),
    ];
  }

  List<Widget> _title(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width * 0.7;
    return [
      Text(
        '채널 정보',
        style: headLine3SemiBold18.copyWith(color: const Color(0xFF000000)),
      ),
      const SizedBox(height: 21),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: 62,
          height: 62,
          child: CircleAvatar(
            backgroundImage: NetworkImage(vm.channel.value.thumbnailUrl),
          ),
        ),
        const SizedBox(width: 9),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: deviceWidth,
                child: Text(vm.channel.value.channelTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: regular18.copyWith(color: const Color(0xFF000000)))),
            Text(
              '구독자 ${vm.channel.value.subscriberCount.subscriberFormatter(addFormat: '명')}',
              style: body1semiBold14.copyWith(color: const Color(0xFF000000)),
            )
          ],
        ),
      ]),
      const SizedBox(height: 36),
      const Divider(thickness: 1, color: Color(0xFFF1F2F6)),
    ];
  }

  List<Widget> _body() {
    return [
      Column(children: [
        Container(
            padding: const EdgeInsets.only(top: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  '구독자 & 조회수 추이',
                  style: headLine3SemiBold18.copyWith(
                      color: const Color(0xFF000000)),
                ),
                const SizedBox(height: 24),
                Text(
                  '구독자 수',
                  style: body3medium13.copyWith(color: const Color(0xFF200000)),
                ),
                const SizedBox(height: 7),
                _buildRichText(
                  beforeNumber: vm.channel.value.subscriberCountYearAgo,
                  afterNumber: vm.channel.value.subscriberCount,
                ),
                const SizedBox(height: 20),
                Text(
                  '누적 조회수',
                  style: body3medium13.copyWith(color: const Color(0xFF200000)),
                ),
                const SizedBox(height: 7),
                _buildRichText(
                    beforeNumber:
                        int.parse(vm.channel.value.totalViewCountYearAgo),
                    afterNumber: int.parse(vm.channel.value.totalViewCount)),
              ],
            )),
      ]),
    ];
  }

  Widget _buildRichText({required int beforeNumber, required int afterNumber}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: beforeNumber.subscriberFormatter(),
            style: title3Bold14.copyWith(color: const Color(0xFFB6BAC7)),
          ),
          TextSpan(
              text: '  -->  ',
              style: title3Bold14.copyWith(color: const Color(0xFFB6BAC7))),
          TextSpan(
              text: afterNumber.subscriberFormatter(),
              style: title3Bold14.copyWith(color: const Color(0xFF141414))),
          const WidgetSpan(child: SizedBox(width: 8)),
          WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: GrowthValueWidget(
                  count: afterNumber, countYearAgo: beforeNumber))
        ],
      ),
    );
  }
}
