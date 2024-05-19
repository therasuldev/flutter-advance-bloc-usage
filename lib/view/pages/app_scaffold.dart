import 'package:first_flutter_project/view/pages/home.dart';
import 'package:flutter/material.dart';

import 'api_example.dart';
import 'proflile.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _bottomBarIndex = 0;
  List<Widget> pages = const [Home(), ApiExample(), Profile()];

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_bottomBarIndex.showAppBarTitle()),
      ),
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (pageIndex) => setState(() => _bottomBarIndex = pageIndex),
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
      // PageView(
      //   controller: pageController,
      //   onPageChanged: (pageIndex) => setState(() => _bottomBarIndex = pageIndex),
      //   children: [...pages],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomBarIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.api), label: 'API'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          // pageController.animateToPage(
          //   index,
          //   duration: const Duration(milliseconds: 200),
          //   curve: Curves.linear,
          // );
          pageController.jumpToPage(index);
          setState(() => _bottomBarIndex = index);
        },
      ),
    );
  }
}

extension on int {
  String showAppBarTitle() {
    if (this == 0) return KAppBarTitle.home.getTitle();
    return KAppBarTitle.profile.getTitle();
  }
}

extension StringExtension on String {
  int getLength() => length;
}

enum AppBarTitle {
  home('Home'),
  profile('Profile');

  final String title;
  const AppBarTitle(this.title);
}

enum KAppBarTitle {
  home,
  profile;

  String getTitle() {
    switch (this) {
      case KAppBarTitle.home:
        return 'Home';
      case KAppBarTitle.profile:
        return 'Profile';
      default:
        return 'UNKNOWN';
    }
  }
}
