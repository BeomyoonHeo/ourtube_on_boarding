import 'package:flutter/material.dart';
import 'package:ourtube_onboarding_by_milo/utils/none_glow_behavior.dart';

class ProgressPageScaffold extends StatelessWidget {
  const ProgressPageScaffold(
      {Key? key, required this.header, required this.title, required this.body})
      : super(key: key);
  final List<Widget> header;
  final List<Widget> title;
  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ScrollConfiguration(
        behavior: NoneGlowBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [...header, ...title, ...body],
          ),
        ),
      ),
    );
  }
}
