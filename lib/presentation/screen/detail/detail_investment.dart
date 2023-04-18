import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/components/sticky_delegate_container.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/detail/detail_investment_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/detail/widget/detail_investment_scaffold.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/detail/widget/header_delegate.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/detail/widget/investment_info_tab.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/detail/widget/tab_bar_delegate.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/home/widget/investment_list.dart';

class DetailInvestment extends BaseView<DetailInvestmentViewModel> {
  const DetailInvestment({Key? key}) : super(key: key);

/*
Slivers 위젯 내부에는 RenderSliver(일반위젯은 RenderParagraph 유형) 유형의 위젯만 받는다 -> 안그러면 에러
구현하고자 하는 위젯에 SliverToBoxAdapter, SliverList, SliverGrid 등으로 Wrapping 하여 사용해야 한다.
 */
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      // 불필요한 Painting 방지
      child: DetailInvestmentScaffold(
        scrollController: vm.scrollController,
        appbar: _appbar,
        header: _header(),
        investmentTab: _tabBar(),
        investmentTabView: _tabView(),
      ),
    );
  }

  Widget _appbar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      elevation: 0.0,
      leadingWidth: 0,
      toolbarHeight: 56,
      forceElevated: innerBoxIsScrolled,
      automaticallyImplyLeading: false,
      title: Container(
        margin: const EdgeInsets.only(top: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            borderRadius: BorderRadius.circular(30),
            child: const Icon(Icons.arrow_back_ios_new_rounded),
            onTap: () => Get.back(),
          ),
        ]),
      ),
      pinned: true,
      flexibleSpace: const FlexibleSpaceBar(
        background: ColoredBox(color: Color(0xff026BFB)),
      ),
    );
  }

  Widget _header() {
    return SliverPersistentHeader(
      delegate: StickyDelegateContainer(
        child: HeaderDelegate(investingAmount: vm.investingAmount),
        minHeight: 108,
        maxHeight: 108,
      ),
    );
  }

  Widget _tabBar() {
    return SliverPersistentHeader(
      delegate: StickyDelegateContainer(
        child: const TabBarDelegate(),
        minHeight: 44,
        maxHeight: 44,
      ),
      pinned: true, // 상단으로 드래그 했을 때 Header 고정 여부
    );
  }

  Widget _tabView() {
    return TabBarView(
      children: [
        InvestmentInfoTab(
          investingAmount: vm.investingAmount,
          totalProfit: vm.allTotalProfit,
          totalAdvertisingProfits: vm.totalAdvertisingProfit,
          totalChannelValue: vm.totalChannelValue,
          sectors: vm.sectors,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: vm.investingChannels.isEmpty
              ? Center(
                  child: Text('투자 내역이 없어요',
                      style: title1Bold16.copyWith(
                          color: const Color(0xFF9FA4B1))),
                )
              : InvestmentList(
                  investedChannels: vm.investingChannels,
                  totalProfit: vm.totalAdvertisingProfit),
        ),
      ],
    );
  }
}
