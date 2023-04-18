import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/virtual_investment_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/widget/category_menu.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/widget/channel_list_grid_view.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/widget/positioned_investment_button.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/widget/search_bar.dart';

class VirtualInvestmentScreen extends BaseView<VirtualInvestmentViewModel> {
  const VirtualInvestmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(moveSearchScreen: vm.moveSearchScreen),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(left: 14, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ..._header(),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 14),
                  height: 36,
                  child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.white, Colors.transparent],
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomRight,
                          stops: [0.95, 1]).createShader(bounds),
                      blendMode: BlendMode.dstIn,
                      child: CategoryMenu(
                          categoryList: vm.categoryList,
                          onPressedCategoryBtn: vm.onPressedCategoryBtn)),
                ),
                const SizedBox(height: 22),
                _recommendOtherChannelButton(),
                const SizedBox(height: 16),
                ChannelListGridView(
                    selectedIndex: vm.selectedIndex,
                    channels: vm.recommendedRandomChannel,
                    onTapedGridViewItem: vm.onTapedGridViewItem,
                    context: context),
              ],
            ),
          ),
          PositionedInvestmentButton(
              channels: vm.recommendedRandomChannel,
              selectedIndex: vm.selectedIndex,
              moveInvestmentProgress: vm.moveInvestmentProgress,
              height: 48,
              width: 165),
        ],
      ),
    );
  }

  List<Widget> _header() {
    return <Widget>[
      Text('천만원으로',
          style: body1semiBold14.copyWith(color: const Color(0xFF026BFB))),
      const Text(
        '투자하고 싶은 유튜브 채널은?',
        style: headLine1Bold24,
      ),
    ];
  }

  Widget _recommendOtherChannelButton() {
    return SizedBox(
      width: 165,
      height: 48,
      child: InkWell(
        onTap: () {
          vm.recommendingChannel();
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(CupertinoIcons.shuffle),
          const SizedBox(width: 8),
          Text(
            '다른 채널 추천',
            style: title2SemiBold16.copyWith(color: const Color(0xFF5C606B)),
          ),
        ]),
      ),
    );
  }
}
