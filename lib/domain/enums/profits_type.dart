import 'package:flutter/material.dart';

enum ProfitType {
  advertisingProfits(name: '광고 수익금', indicatorColor: Color(0xFF5388D8)),
  channelValue(name: '채널 가치', indicatorColor: Color(0xFFF4BE37));

  final String name;
  final Color indicatorColor;

  const ProfitType({required this.name, required this.indicatorColor});

  factory ProfitType.fromString(String word) {
    switch (word) {
      case 'advertisingProfits':
        return ProfitType.advertisingProfits;
      case 'channelValue':
        return ProfitType.channelValue;
      default:
        throw Exception('enum not found');
    }
  }
}
