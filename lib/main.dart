import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:first_flutter_project/core/provider/app_bloc/app_bloc.dart';
import 'package:first_flutter_project/core/provider/app_bloc/app_event.dart';
import 'package:first_flutter_project/core/provider/profile_bloc/profile_bloc.dart';
import 'package:first_flutter_project/core/repository/cache_repository.dart';
import 'package:first_flutter_project/test.dart';
import 'package:first_flutter_project/view/pages/app_scaffold.dart';
import 'package:first_flutter_project/view/pages/profile.dart';

class ConstantValues {
  static GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();
}

class A {
  final String name;
  A({required this.name});

  factory A.fromJson(Map<String, dynamic> json) {
    return A(name: json['name']);
  }
  Map<String, dynamic> toJson() {
    return {"name": name};
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final a = A(name: 'DART');
  final value = json.encode(a.toJson());
  await CacheRepositoryImpl().put('key', value);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc()..add(GetUsersEvent()),
        ),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: ConstantValues.snackBarKey,
        restorationScopeId: 'app.name',
        theme: ThemeData(useMaterial3: false),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const AppScaffold(),
          '/profile': (context) => const Profile(),
        },
      ),
    );
  }
}
