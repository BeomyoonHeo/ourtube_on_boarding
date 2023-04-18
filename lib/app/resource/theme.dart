import 'package:flutter/material.dart';

const TextStyle headLine1Bold24 = TextStyle(
  fontFamily: 'pretendard_bold',
  fontSize: 24,
  height: 37 / 24,
  fontWeight: FontWeight.w700,
  color: Color(0xFF141414),
);

const TextStyle headLine2Bold20 = TextStyle(
  fontFamily: 'pretendard_semiBold',
  fontSize: 20,
  height: 30 / 20,
  fontWeight: FontWeight.w700,
);

const TextStyle headLine3SemiBold18 = TextStyle(
  fontFamily: 'pretendard_semiBold',
  fontSize: 18,
  height: 22 / 18,
  fontWeight: FontWeight.w600,
  color: Color(0xFF141414),
);

const TextStyle web3Bold32 = TextStyle(
  fontSize: 32,
  fontFamily: 'pretendard_bold',
  fontWeight: FontWeight.w700,
  height: 48 / 32, // height/fontSize
);

const TextStyle title3Bold14 = TextStyle(
  fontFamily: 'pretendard_bold',
  fontSize: 14,
  height: 20 / 14,
  fontWeight: FontWeight.w700,
  color: Color(0xFF141414),
);

const TextStyle alertRegular12 = TextStyle(
  fontSize: 12,
  height: 18 / 12,
  fontFamily: 'pretendard_regular',
  fontWeight: FontWeight.w400,
  color: Color(0xFF141414),
);

const TextStyle regular16 = TextStyle(
  fontSize: 16,
  height: 20 / 16,
  fontFamily: 'pretendard_regular',
  fontWeight: FontWeight.w500,
  color: Color(0xFF141414),
);

const TextStyle regular18 = TextStyle(
  fontSize: 18,
  height: 37 / 18,
  fontFamily: 'pretendard_regular',
  fontWeight: FontWeight.w700,
  color: Color(0xFF141414),
);

const TextStyle title2 = TextStyle(
  fontSize: 16,
  fontFamily: 'pretendard_semiBold',
  fontWeight: FontWeight.w600,
  color: Color(0xff000000),
);

const TextStyle title2SemiBold16 = TextStyle(
  fontSize: 16,
  fontFamily: 'pretendard_semiBold',
  fontWeight: FontWeight.w600,
);

const TextStyle title1Bold16 = TextStyle(
  fontSize: 16,
  height: 22 / 16,
  fontFamily: 'pretendard_bold',
  fontWeight: FontWeight.w600,
  color: Color(0xff9FA4B1),
);

const TextStyle body1 = TextStyle(
  fontSize: 14,
  fontFamily: 'pretendard_medium',
  fontWeight: FontWeight.w500,
  color: Color(0xff626C7A),
);

const TextStyle bodyAlertSemiBold12 = TextStyle(
  fontSize: 12,
  height: 18 / 12,
  fontFamily: 'pretendard_semiBold',
  fontWeight: FontWeight.w600,
);

const TextStyle bodyAlertRegular12 = TextStyle(
  fontSize: 12,
  height: 18 / 12,
  fontFamily: 'pretendard_regular',
  fontWeight: FontWeight.w400,
);

const TextStyle body1semiBold14 = TextStyle(
  fontSize: 14,
  height: 22 / 14,
  fontFamily: 'pretendard_semiBold',
  fontWeight: FontWeight.w600,
  color: Color(0xFFFFFFFF),
);

const TextStyle body2medium14 = TextStyle(
  fontSize: 14,
  fontFamily: 'pretendard_medium',
);

const TextStyle body3medium13 = TextStyle(
  fontSize: 13,
  fontFamily: 'pretendard_medium',
  height: 16 / 13,
  fontWeight: FontWeight.w500,
);

class CustomTheme {
  static ThemeData themeData() {
    return ThemeData(
      backgroundColor: const Color(0xFFFFFFFF),
      fontFamily: 'pretendard_regular',
      textTheme: const TextTheme(
        headline2: TextStyle(
          fontSize: 20,
          fontFamily: 'pretendard_bold',
          fontWeight: FontWeight.w700,
          color: Color(0xff000000),
        ),
        bodyText2: TextStyle(
          fontSize: 13,
          fontFamily: 'pretendard_medium',
          fontWeight: FontWeight.w500,
          color: Color(0xff9fa4b1),
        ),
      ),
    );
  }
}
