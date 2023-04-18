import 'package:flutter/material.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';

void customDialog(BuildContext context) {
  showDialog(
      context: context,
      //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          //Dialog Main Title
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "보유 금액이 부족해요",
                style: headLine2Bold20.copyWith(color: const Color(0xFF141414)),
              ),
            ],
          ),
          //
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "10,000원 이상의 금액이 필요합니다.",
                style: body2medium14.copyWith(color: const Color(0xFF969BAB)),
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: const Color(0xFFDCDEE5),
                        minimumSize: const Size(0.0, 0.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                      ),
                      child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          child: Text(
                            "닫기",
                            style: title2SemiBold16.copyWith(
                                color: const Color(0xFF4A4D57)),
                          )),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: const Color(0xFF026BFB),
                      minimumSize: const Size(0.0, 0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 48,
                      child: Text(
                        "다음",
                        style: title2SemiBold16.copyWith(
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ],
        );
      });
}
