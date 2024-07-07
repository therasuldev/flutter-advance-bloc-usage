import 'dart:convert';

import 'package:first_flutter_project/core/repository/cache_repository.dart';
import 'package:first_flutter_project/main.dart';
import 'package:flutter/material.dart';

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  @override
  void initState() {
    super.initState();
    //BlocProvider.of<AppBloc>(context).add(GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String?>(
          future: CacheRepositoryImpl().get('key'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final aJson = json.decode(snapshot.data!);
            final a = A.fromJson(aJson);
            return Text(a.name);
          },
        ),
      ),
    );
  }
}
