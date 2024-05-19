import 'package:first_flutter_project/test.dart';
import 'package:first_flutter_project/view/pages/app_scaffold.dart';
import 'package:first_flutter_project/view/pages/proflile.dart';
import 'package:flutter/material.dart';


void main() {
  print(PrivateClass.instance!.a);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app.name',
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AppScaffold(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
