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
  List users = [
    ' cisncsc',
    ' cscsc',
    ' cisncdscsc',
    ' 2222',
    ' 444',
    ' 6666',
    ' 888',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User page'),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            // ListView.builder(
            //   controller: ScrollController(),
            //   itemCount: users.length,
            //   shrinkWrap: true,
            //   scrollDirection: Axis.vertical,
            //   itemBuilder: (context, index) {
            //     return Container(
            //         height: 100,
            //         margin: const EdgeInsets.all(10),
            //         width: MediaQuery.sizeOf(context).width,
            //         color: Colors.orange,
            //         child: Text(users[index]));
            //   },
            // ),
            // SizedBox(
            //   height: 300,
            //   child: GridView.builder(
            //     controller: ScrollController(),
            //     shrinkWrap: true,
            //     itemCount: 10,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            //     itemBuilder: (context, index) {
            // return Container(
            //   margin: const EdgeInsets.all(10),
            //   width: MediaQuery.sizeOf(context).width,
            //   color: Colors.orange,
            //   child: const Text('icnsincs'),
            // );
            //     },
            //   ),
            // )

            Wrap(
              children: [
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.sizeOf(context).width / 3,
                  color: Colors.orange,
                  child: const Text('icnsincs'),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.sizeOf(context).width / 3,
                  color: Colors.orange,
                  child: const Text('icnsincs'),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.sizeOf(context).width / 3,
                  color: Colors.orange,
                  child: const Text('icnsincs'),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.sizeOf(context).width / 3,
                  color: Colors.orange,
                  child: const Text('icnsincs'),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.sizeOf(context).width / 3,
                  color: Colors.orange,
                  child: const Text('icnsincs'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
