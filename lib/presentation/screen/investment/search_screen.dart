import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/search_screen_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/widget/channel_grid_btn_item.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/widget/custom_app_bar.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/widget/positioned_investment_button.dart';

class SearchScreen extends BaseView<SearchScreenViewModel> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            onSubmitted: vm.onSubmitted, textController: vm.textController),
        // UI에 영향을 주지 않는 value
        // 분기를 하지 않으면 된다
        body: _scrollingGridView(context));
  }

  Widget _scrollingGridView(BuildContext context) {
    return Obx(
      () => vm.channels.isEmpty && vm.keyword.isEmpty
          ? Center(
              child: Text(
              '채널을 입력 해주세요!',
              style: title1Bold16.copyWith(color: const Color(0xFF9FA4B1)),
            ))
          : Container(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom == 0
                      ? 0
                      : 16), // MediaQuery로 현재 context에 bottom의 viewInset 여부 파악
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 18),
                      Expanded(
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.white, Colors.transparent],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.8, 0.95],
                          ).createShader(bounds),
                          blendMode: BlendMode.dstIn,
                          child: _buildPagedGridView(),
                        ),
                      ),
                    ],
                  ),
                  PositionedInvestmentButton(
                    moveInvestmentProgress: vm.moveInvestmentProgress,
                    channels: vm.channels,
                    selectedIndex: vm.selectedIndex,
                    height: 48,
                    width: 300,
                  ),
                ],
              ),
            ),
    );
  }

  PagedGridView<int, Channel> _buildPagedGridView() {
    return PagedGridView(
      showNoMoreItemsIndicatorAsGridChild: false,
      showNewPageProgressIndicatorAsGridChild: false,
      pagingController: vm.pagingController,
      builderDelegate: PagedChildBuilderDelegate<Channel>(
        noMoreItemsIndicatorBuilder: (context) => _buildNoMoreItemIndicator(),
        noItemsFoundIndicatorBuilder: (context) =>
            _buildNoItemsFoundIndicator(),
        newPageProgressIndicatorBuilder: (context) =>
            _buildNewPageProgressIndicator(),
        itemBuilder: (context, item, index) {
          bool isSelected = vm.selectedIndex.value == index;
          return GestureDetector(
            onTap: () {
              isSelected
                  ? vm.selectedIndex.value = null
                  : vm.selectedIndex.value = index;
            },
            child: ChannelGridBtnItem(
              selectedIndex: vm.selectedIndex,
              channel: item,
              index: index,
              onTapedGridViewItem: vm.onTapedGridViewItem,
            ),
          );
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 11,
          mainAxisSpacing: 16,
          crossAxisCount: 2,
          childAspectRatio: 1.27),
    );
  }

  SizedBox _buildNewPageProgressIndicator() {
    return const SizedBox(
      height: 200,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildNoItemsFoundIndicator() {
    return Center(
      child: Text(
        '검색된 채널이 없어요',
        style: title1Bold16.copyWith(
          color: const Color(0xFF9FA4B1),
        ),
      ),
    );
  }

  Widget _buildNoMoreItemIndicator() {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '검색키워드의 마지막 입니다. :)',
            style: title1Bold16.copyWith(
              color: const Color(0xFF9FA4B1),
            ),
          )
        ],
      ),
    );
  }
}
