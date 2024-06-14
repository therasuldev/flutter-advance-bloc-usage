import 'package:first_flutter_project/core/provider/app_bloc/app_bloc.dart';
import 'package:first_flutter_project/core/provider/app_bloc/app_event.dart';
import 'package:first_flutter_project/core/provider/app_bloc/app_state.dart';
import 'package:first_flutter_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          controller: _scrollController,
          itemCount: 100,
          itemBuilder: (c, i) {
            return Container(
              color: Colors.red,
              margin: const EdgeInsets.all(10),
              height: 100,
              width: 200,
              child: Text(
                i.toString(),
                style: const TextStyle(fontSize: 30),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Effective height of each item
          double itemHeight = 100 + 20; // height + margin
          // Index of the item you want to scroll to
          int targetIndex = 50;
          // Calculate the position to scroll to (center of the target item)
          double targetPosition = targetIndex * itemHeight +
              (itemHeight / 2) -
              (MediaQuery.of(context).size.height / 2);
          // Ensure the target position is within valid bounds
          targetPosition = targetPosition.clamp(
              0.0, _scrollController.position.maxScrollExtent);
          _scrollController.animateTo(
            targetPosition,
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
          );
        },
        child: const Text('Get'),
      ),
    );
  }
}
