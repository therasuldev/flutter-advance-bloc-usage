import 'package:first_flutter_project/lesson/snackbar_without_context.dart';
import 'package:first_flutter_project/news.dart';
import 'package:flutter/material.dart';

import 'lesson/pages/index.dart';

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
    return const SafeArea(
      child: Scaffold(
        body: News(),
      ),
    );
  }
}
