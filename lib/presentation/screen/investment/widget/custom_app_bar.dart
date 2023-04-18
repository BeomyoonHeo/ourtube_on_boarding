import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Function(String) onSubmitted;
  final TextEditingController textController;
  final double height;
  const CustomAppBar(
      {super.key,
      required this.onSubmitted,
      required this.textController,
      this.height = 56});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top + 10,
          right: 16,
          left: 16),
      child: Row(
        children: [..._searchField()],
      ),
    );
  }

  List<Widget> _searchField() {
    InputDecoration customDecoration = InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        hintText: '채널 검색',
        hintStyle: body2medium14.copyWith(color: const Color(0xFFC9CCD7)),
        prefixIcon: IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF4A4D57)),
            onPressed: () {
              onSubmitted(textController.text);
            }),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xFFDCDEE5)),
            borderRadius: BorderRadius.circular(15)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xFFDCDEE5)),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xFFDCDEE5)),
            borderRadius: BorderRadius.circular(15)));
    return [
      Expanded(
        child: TextField(
          onSubmitted: onSubmitted,
          controller: textController,
          decoration: customDecoration,
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 13),
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Text(
            '취소',
            style: title2SemiBold16.copyWith(
              color: const Color(0xFF026BFB),
            ),
          ),
        ),
      )
    ];
  }
}
