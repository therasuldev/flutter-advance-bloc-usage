import 'package:first_flutter_project/core/model/user_model.dart';
import 'package:first_flutter_project/core/service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  late Future<List<UserModel>>? fetchUsers;

  @override
  void initState() {
    super.initState();
    fetchUsers = ApiService().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: fetchUsers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CupertinoActivityIndicator();
            }
            final users = snapshot.data;

            return ListView.builder(
              itemCount: users?.length ?? 0,
              itemBuilder: (context, index) {
                final user = users?[index];

                return ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(user!.avatar)),
                  title: Text(user.userName),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
