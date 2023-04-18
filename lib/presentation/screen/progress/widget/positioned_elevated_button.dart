import 'package:flutter/material.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';

class PositionedElevateButton extends StatelessWidget {
  const PositionedElevateButton({Key? key, this.onPressed, required this.text})
      : super(key: key);
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: 48,
        width: MediaQuery.of(context).size.width - 32,
        bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 5 : 16,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(0, 0),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 0.0,
            //MaterialState의 State에 따라 버튼 색 결정
            foregroundColor: const Color(0xFFFFFFFF),
            backgroundColor: const Color(0xFF026BFB),
            textStyle:
                title2SemiBold16.copyWith(color: const Color(0xFFFFFFFF)),
            disabledBackgroundColor: const Color(0xFFCDE2FF),
            disabledForegroundColor: const Color(0xFFFFFFFF),
          ),
          onPressed: onPressed,
          child: Text(text),
        ));
  }
}
