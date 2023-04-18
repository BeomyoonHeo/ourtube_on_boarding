import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/home/home_screen_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/home/widget/empty_investment_list.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/home/widget/home_screen_scaffold.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/home/widget/investment_list.dart';
import 'package:ourtube_onboarding_by_milo/utils/format.dart';

import '../../../app/resource/theme.dart';

class HomeScreen extends BaseView<HomeScreenViewModel> {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenScaffold(
      appBar: _appBar(),
      header: _header(),
      title: _title(context),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leadingWidth: 130,
      toolbarHeight: 56, //앱바 높이 지정
      elevation: 0.0,
      backgroundColor: Colors.transparent, // appbar 투명색으로 변경
      leading: InkWell(
        onLongPress: () {
          vm.userInitialize();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 14),
          child: SvgPicture.asset(
            'assets/images/ourtube_logo.svg',
            fit: BoxFit.contain, // 이미지의 크기를 원본사이즈로 유지
          ),
        ),
      ),
    );
  }

  List<Widget> _header() {
    return <Widget>[
      Obx(() => Container(
            margin: const EdgeInsets.only(top: 16),
            child: Text(
              '${vm.user.value?.name}님의 남은 가상 투자 금액',
              textAlign: TextAlign.left,
              style: body1semiBold14.copyWith(color: const Color(0xFF000000)),
            ),
          )),
      Obx(() => Text(
            '${vm.user.value?.amount.moneyFormat(addFormat: '원')}',
            style: web3Bold32.copyWith(color: const Color(0xFF000000)),
          )),
      Container(
        margin: const EdgeInsets.only(top: 25),
        height: 12,
        color: const Color(0xFFF6F7F9),
      ),
    ];
  }

  Widget _title(BuildContext context) {
    return InkWell(
      onTap: vm.moveDetailInvestment,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '투자',
              style: CustomTheme.themeData().textTheme.headline2,
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xffB6BAC7),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Obx(() => vm.investingChannels.isEmpty
        ? const EmptyInvestmentList()
        : InvestmentList(
            investedChannels: vm.investingChannels,
            totalProfit: vm.totalProfit,
          ));
  }
}
