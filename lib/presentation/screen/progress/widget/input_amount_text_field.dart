import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

/*
기존 텍스트 필드로 디자인 구성 및 로직 구성이 잘 생각이 나지 않아서 아워튜브 앱의 입금로직을 레퍼런스 하였습니다.
기존 텍스트 필드를 GestureDetector와 Text 위젯을 사용하여 텍스트필드를 커스터 마이징 하였습니다.
 */
class InputAmountTextField extends StatelessWidget {
  const InputAmountTextField({
    Key? key,
    required this.errorMassage,
    required this.controller,
    required this.onChanged,
    required this.inputAmountValue,
    required this.focusNode,
  }) : super(key: key);
  final RxString errorMassage;
  final RxString inputAmountValue;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      //obx 위젯을 통해 Rx객체의 변화를 감지하여 해당 위젯을 리빌드한다.
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              /*기존 텍스트 필드를 감추어서 터치를 할 수 없는 상태이지만 제스쳐디텍터로 해당 위젯이 터지가 된다면 포커스 노드로 연결
              되어있는 TextField로 포커싱 해준다.
               */
              focusNode.requestFocus();
            },
            child: Container(
              width: double.infinity, //double.infinity를 통해서 부모위젯의 width를 따라간다.
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xFFDCDEE5)))),
              child: Text(
                  inputAmountValue.value == ''
                      ? '입금 금액 입력'
                      : '${inputAmountValue.value} 원',
                  style: inputAmountValue.value == ''
                      ? headLine1Bold24.copyWith(color: const Color(0xFFB6BAC7))
                      : headLine1Bold24.copyWith(
                          color: const Color(0xFF141414))),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorMassage.value,
              style:
                  bodyAlertRegular12.copyWith(color: const Color(0xFFFF628F)),
            ),
          ),
          SizedBox(
            height: 0,
            child: TextField(
              focusNode: focusNode,
              showCursor: false, // 커서 감추기
              enableInteractiveSelection: false, // 복붙 금지
              keyboardType: TextInputType.number,
              inputFormatters: [
                ThousandsFormatter()
              ], //ThousandsFormatter를 통하여 사용자가 입력하는 값을 전부 ###,### 단위로 변환시켜주는 formatter이다.
              style: headLine1Bold24.copyWith(
                  color: Colors
                      .transparent), // 글자 색을 투명하게 해서 text위젯의 text만 보이게 한다.
              controller: controller,
              onChanged: onChanged,
              decoration: const InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          )
        ],
      );
    });
  }
}
