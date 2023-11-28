import 'package:first_flutter_project/lesson/snackbar_without_context.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Second extends StatefulWidget {
  const Second({super.key});
  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [_Tabbar(controller: controller), _TabBarView(controller: controller)],
      ),
    );
  }
}

class _Tabbar extends StatelessWidget {
  const _Tabbar({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: const [
        Tab(
          iconMargin: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home),
              SizedBox(width: 5),
              Text('AZTU'),
            ],
          ),
        ),
        Tab(
          text: "BDU",
          icon: Icon(Icons.person),
        ),
        Tab(
          text: "ADPU",
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}

class _TabBarView extends StatelessWidget {
  const _TabBarView({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller,
        children: const [AZtu(), BDU(), ADPU()],
      ),
    );
  }
}

class AZtu extends StatelessWidget {
  const AZtu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.orange,
      alignment: Alignment.center,
      child: TextButton(
        child: const Text('AZTU'),
        onPressed: () {
          const snackbar = SnackBar(content: Text('Snackbar'));
          SnackBarClass.snackbarKey.currentState!.showSnackBar(snackbar);
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Snackbar')));
        },
      ),
    );
  }
}

class BDU extends StatelessWidget {
  const BDU({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.orange,
      alignment: Alignment.center,
      child: const Text('BDU'),
    );
  }
}

class ADPU extends StatelessWidget {
  const ADPU({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.orange,
      alignment: Alignment.center,
      child: const Text('ADPU'),
    );
  }
}
