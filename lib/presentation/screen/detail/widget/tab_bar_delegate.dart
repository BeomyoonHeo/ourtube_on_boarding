import 'package:flutter/material.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';

class TabBarDelegate extends StatelessWidget {
  const TabBarDelegate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        tabs: [
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: const Text(
                "정보",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: const Text(
                "채널",
              ),
            ),
          ),
        ],
        indicatorWeight: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        labelStyle: title3Bold14,
        unselectedLabelColor: const Color(0xFF969BAB),
        labelColor: const Color(0xFF141414),
        indicatorColor: const Color(0xFF141414),
        indicatorSize: TabBarIndicatorSize.tab, //인디케이터 사이즈(width) Tab 단위로 늘리기
      ),
    );
  }
}
