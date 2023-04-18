import 'package:flutter/material.dart';
import 'package:ourtube_onboarding_by_milo/utils/none_glow_behavior.dart';

class DetailInvestmentScaffold extends StatelessWidget {
  final Function appbar;
  final Widget header;
  final Widget investmentTab;
  final Widget investmentTabView;
  final ScrollController scrollController;
  const DetailInvestmentScaffold(
      {Key? key,
      required this.appbar,
      required this.header,
      required this.investmentTab,
      required this.investmentTabView,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        animationDuration: const Duration(milliseconds: 500),
        child: NestedScrollView(
          controller: scrollController,
          scrollBehavior: NoneGlowBehavior(),
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              appbar(innerBoxIsScrolled),
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: header,
              ),
              investmentTab,
            ];
          },
          body: investmentTabView,
        ),
      ),
    );
  }
}
