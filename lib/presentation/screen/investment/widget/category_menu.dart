import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/domain/enums/channel_category.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu(
      {super.key,
      required this.categoryList,
      required this.onPressedCategoryBtn});
  final RxMap<ChannelCategory, RxBool> categoryList;
  final Function onPressedCategoryBtn;
  @override
  Widget build(BuildContext context) {
    return _categoryMenu();
  }

  Widget _categoryMenu() {
    List<Widget> widgets = categoryList.entries
        .map((entries) => Obx(() => Container(
              margin: const EdgeInsets.only(right: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(0, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                  elevation: 0.0,
                  foregroundColor: entries.value.isTrue
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF969BAB),
                  backgroundColor: entries.value.isTrue
                      ? const Color(0xFF026BFB)
                      : Colors.transparent,
                  textStyle: body1semiBold14,
                ),
                onPressed: () {
                  onPressedCategoryBtn(entries.key.keyword);
                },
                child: Text(entries.key.name),
              ),
            )))
        .toList();
    return ListView(
      scrollDirection: Axis.horizontal,
      children: widgets,
    );
  }
}
