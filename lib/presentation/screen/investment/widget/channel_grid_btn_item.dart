import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';
import 'package:ourtube_onboarding_by_milo/utils/format.dart';

class ChannelGridBtnItem extends StatelessWidget {
  final Rxn<int> selectedIndex;
  final Channel channel;
  final int index;
  final Function onTapedGridViewItem;
  const ChannelGridBtnItem(
      {Key? key,
      required this.selectedIndex,
      required this.channel,
      required this.index,
      required this.onTapedGridViewItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapedGridViewItem(index);
      },
      child: Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedIndex.value == index
                  ? const Color(0xFF2F3037)
                  : const Color(0xFFF7F8FA),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(channel.thumbnailUrl),
                ),
                const SizedBox(height: 10),
                Text(channel.channelTitle,
                    maxLines: 1,
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: selectedIndex.value == index
                        ? title1Bold16.copyWith(color: const Color(0xFFFFFFFF))
                        : title1Bold16.copyWith(
                            color: const Color(0xFF2F3037))),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/user_icon.svg'),
                    Text(
                        channel.subscriberCount
                            .subscriberFormatter(addFormat: '명'),
                        style: selectedIndex.value == index
                            ? body3medium13.copyWith(
                                color: const Color(0xFF969BAB))
                            : body3medium13.copyWith(
                                color: const Color(0xFFC9CCD7))),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
