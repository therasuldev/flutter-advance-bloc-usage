import 'package:first_flutter_project/lesson28/core/service/news_service.dart';
import 'package:first_flutter_project/news_card.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  late NewsService _service;

  @override
  void initState() {
    super.initState();
    _service = NewsService();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 10),
      // height: double.infinity,
      color: HexColor('#d68f35'),
      child: FutureBuilder(
        future: _service.getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final news = snapshot.data![index];
              return NewsCard(
                title: news.title,
                date: 'Noy 11, 2023',
                author: 'Cavid Hüseynov',
                url: news.url,
              );
            },
          );
        },
      ),
    );
  }
}
