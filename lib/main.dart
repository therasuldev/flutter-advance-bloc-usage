import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'view/pages/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScaffold(),
    );
  }
}

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({super.key});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  final pages = [const First(), const Second(), const Third()];
  final PageController pageController = PageController();

  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _key.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: true,
      drawerDragStartBehavior: DragStartBehavior.down,
      endDrawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: openDrawer,
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
        onPageChanged: (pageIndex) {
          setState(() {});
          currentIndex = pageIndex;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: currentIndex,
        onTap: (bottomIndex) {
          setState(() {});
          currentIndex = bottomIndex;
          pageController.animateToPage(
            currentIndex,
            duration: const Duration(milliseconds: 700),
            curve: Curves.linear,
          );
        },
      ),
    );
  }
}
