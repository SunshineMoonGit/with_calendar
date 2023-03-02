import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final AppBar? appBarWidget;
  final Widget? floatingActionButton;

  const DefaultLayout({
    Key? key,
    required this.body,
    this.bottomNavigationBar,
    this.appBarWidget,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
