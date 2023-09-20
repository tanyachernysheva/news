import 'package:flutter/material.dart';
import 'package:news/models/news.dart';

class NewsScreen extends StatefulWidget {
  final News? news;
  const NewsScreen({
    super.key,
    this.news,
  });

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(widget.news?.image ?? ''),
        ),
      ]),
    );
  }
}
