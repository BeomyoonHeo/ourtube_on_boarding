import 'package:intl/intl.dart';

/*
format등의 단일함수나 여러함수들의 묶음로직이 필요한 경우
1. extension을 사용하여 primitive Type에 대응하기
2. class 내부에서 Static을 통해 로직 구현하기 -> 로직 종류가 많을 때 묶기 위함
 */

extension GetNumberFormat on int {
  String subscriberFormatter({String? addFormat}) {
    int thousand = 1000;
    int tenThousand = thousand * 10;
    int hundredMillion = tenThousand * tenThousand;
    if (this >= hundredMillion) {
      return NumberFormat('###.#억${addFormat ?? ""}')
          .format(this / hundredMillion);
    } else if (this >= tenThousand && this < hundredMillion) {
      return NumberFormat('###.#만${addFormat ?? ""}')
          .format(this / tenThousand);
    } else if (this >= thousand && this < tenThousand) {
      return NumberFormat('###.#천${addFormat ?? ""}').format(this / thousand);
    } else {
      return NumberFormat('###${addFormat ?? ""}').format(this);
    }
  }

  String moneyFormat({String? addFormat}) {
    return NumberFormat('###,###${addFormat ?? ""}').format(this);
  }
}

extension GetParseInt on String {
  int? moneyFormat() {
    if (isEmpty) {
      return null;
    } else {
      // 해당 String 값이 parsing이 안될 경우 강제적으로 0을 리턴한다.
      try {
        return int.parse(replaceAll(',', ''));
      } on FormatException {
        return 0;
      }
    }
  }
}
