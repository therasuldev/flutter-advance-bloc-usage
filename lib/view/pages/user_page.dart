import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    super.key,
    required this.username,
    required this.email,
  });

  final String username;
  final String email;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  StreamController<List<int>> streamController =
      StreamController<List<int>>.broadcast();
  List<int> list = [];
  int index = 0;

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    streamController.stream.listen((data) {
      log(data.toString());
    });
    textController.addListener(() {
      log("From Text Field:  ${textController.text}");
      setState(() {});
    });
  }

  Future<int> getNumber() async {
    return Future.value(5550);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            TextField(controller: textController),
            const TabPageSelectorIndicator(
              backgroundColor: Colors.red,
              borderColor: Colors.blue,
              size: 20,
            ),
            StreamBuilder(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CupertinoActivityIndicator());
                  }
                  final data = snapshot.data;
                  return Center(
                      child: Row(
                    children: data!.map((value) {
                      return Text(value.toString());
                    }).toList(),
                  ));
                }),
            const SizedBox(height: 100),
            FutureBuilder(
                future: getNumber(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CupertinoActivityIndicator());
                  }
                  final data = snapshot.data;
                  return Text(data.toString());
                }),
            const Spacer(flex: 2),
            Container(
              color: Colors.orange.shade200,
              height: 150,
              width: 170,
              child: const Text(
                'ibcwiciwciwci w ciw ci wic wi',
                //overflow: TextOverflow.ellipsis,
                // maxLines: 1,
                // softWrap: false,

                style: TextStyle(decoration: TextDecoration.underline),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                // index++;
                // list.add(index);
                // streamController.sink.add(list);

                log(getNumber().toString());
                final data = await getNumber();
              },
              icon: const Icon(Icons.phone),
              label: const Text('Button'),
            ),
            const Spacer(flex: 4),
          ],
        )

        // Center(
        //   child: Container(
        //     height: 200,
        //     width: 200,
        //     decoration: const BoxDecoration(
        //       color: Colors.red,
        //       shape: BoxShape.circle,
        //     ),
        //     child: Stack(
        //       clipBehavior: Clip.none,
        //       alignment: Alignment.topCenter,
        //       children: [
        //         Positioned(
        //           top: -50,
        //           child: Container(
        //             height: 100,
        //             width: 100,
        //             decoration: const BoxDecoration(
        //               color: Colors.blue,
        //               shape: BoxShape.circle,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
