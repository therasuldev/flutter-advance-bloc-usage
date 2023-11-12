import 'package:first_flutter_project/view/pages/about.dart';
import 'package:first_flutter_project/view/pages/home_page.dart';
import 'package:flutter/material.dart';

class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  // List pages = [ HomePage(age:age), const AboutPage()];
  int index = 0;
  int age = 29;

  List getScreens() {
    return [
      HomePage(age: age),
      const AboutPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("App name"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            showPopupMenu(context);
          },
        ),
      ),
      body: getScreens()[index],
    );
  }

  void showPopupMenu(BuildContext context) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          const Offset(0, 0),
          const Offset(0, 0),
        ),
        Offset.zero & overlay.size,
      ),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          value: 'item1',
          child: const Text('Home'),
          onTap: () {
            setState(() {
              index = 0;
            });
          },
        ),
        PopupMenuItem(
          value: 'item2',
          child: const Text('About'),
          onTap: () {
            setState(() {
              index = 1;
            });
          },
        ),
      ],
    ).then((value) {
      if (value != null) {
        print('Selected: $value');
      }
    });
  }
}
