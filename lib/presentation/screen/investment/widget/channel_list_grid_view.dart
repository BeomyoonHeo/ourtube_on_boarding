import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/investment/widget/channel_grid_btn_item.dart';
import 'package:ourtube_onboarding_by_milo/utils/none_glow_behavior.dart';

class ChannelListGridView extends StatelessWidget {
  const ChannelListGridView({
    Key? key,
    required this.channels,
    required this.context,
    required this.selectedIndex,
    required this.onTapedGridViewItem,
  }) : super(key: key);

  final RxList<Channel> channels;
  final BuildContext context;
  final Rxn<int> selectedIndex;
  final Function onTapedGridViewItem;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
            child: ScrollConfiguration(
          behavior: NoneGlowBehavior(),
          child: GridView.builder(
            itemCount: channels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 11,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: 1.27),
            itemBuilder: (context, index) {
              return ChannelGridBtnItem(
                  channel: channels[index],
                  selectedIndex: selectedIndex,
                  index: index,
                  onTapedGridViewItem: onTapedGridViewItem);
            },
          ),
        )));
  }
}
