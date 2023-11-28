import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  void removeItem(int index) {
    listKey.currentState!.removeItem(index, (context, animation) {
      return _buildItem(animation, index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedList(
        key: listKey,
        initialItemCount: 50,
        itemBuilder: (context, index, animation) {
          return _buildItem(animation, index);
        },
      ),
    );
  }

  Widget _buildItem(Animation<double> animation, int index) {
    return ScaleTransition(
      scale: animation,
      child: ListTile(
        leading: Text(
          index.toString(),
          style: const TextStyle(fontSize: 20),
        ),
        title: const Text('Home page tutorial'),
        trailing: IconButton(
          onPressed: () => removeItem(index),
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
