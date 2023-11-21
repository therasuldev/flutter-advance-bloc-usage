import 'package:first_flutter_project/snackbar_without_context.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'view/pages/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: SnackBarClass.snackbarKey,
      debugShowCheckedModeBanner: false,
      home: const HomeScaffold(),
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
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawerEnableOpenDragGesture: true,
        drawerDragStartBehavior: DragStartBehavior.down,
        endDrawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'Home page',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: openDrawer,
              icon: const Icon(Icons.favorite_outline, color: Colors.white),
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
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.add), label: 'Add'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
          ],
          selectedIndex: currentIndex,
          onDestinationSelected: (bottomIndex) {
            setState(() {});
            currentIndex = bottomIndex;
            pageController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 700),
              curve: Curves.linear,
            );
          },
        ),
      ),
    );
  }
}
