import 'package:flutter/material.dart';

class HomeScreenScaffold extends StatelessWidget {
  final AppBar appBar;
  final List<Widget> header;
  final Widget title;
  final Widget body;
  const HomeScreenScaffold({
    Key? key,
    required this.appBar,
    required this.header,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...header,
              const SizedBox(height: 25),
              title,
              Expanded(child: body),
            ],
          ),
        ));
  }
}
