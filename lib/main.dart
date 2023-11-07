import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 0;

  void _incrementNumber() {
    setState(() {
      number += 5;
    });
  }

  final List<String> items = List.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SizedBox(
            //width: MediaQuery.sizeOf(context).width * .25,
            child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return GridItem(item: items[index]);
          },
        )),

        // CarouselSlider(
        //   options: CarouselOptions(height: 400.0),
        //   items: [1, 2, 3, 4, 5].map((i) {
        //     return Builder(
        //       builder: (BuildContext context) {
        // return Container(
        //   width: MediaQuery.of(context).size.width,
        //   margin: const EdgeInsets.symmetric(horizontal: 5.0),
        //   decoration: const BoxDecoration(color: Colors.amber),
        //   child: Text(
        //     'text $i',
        //     style: const TextStyle(fontSize: 16.0),
        //   ),
        // );
        //       },
        //     );
        //   }).toList(),
        // ),

        // Card(
        //   margin: const EdgeInsets.all(20.0),
        //   child: SizedBox(
        //     height: MediaQuery.sizeOf(context).height * .4,
        //     child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: 3,
        //       itemBuilder: (context, index) => Container(
        //         padding: const EdgeInsets.all(15),
        //         width: MediaQuery.sizeOf(context).width,
        //         child: Image.network(
        //           'https://images.pexels.com/photos/18596173/pexels-photo-18596173/free-photo-of-beautiful-blonde-woman-sitting-in-front-of-the-plants.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.message),
          ),
        ]),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String item;

  const GridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return const Card(margin: EdgeInsets.all(8.0), child: Text('TEXT'));
  }
}
