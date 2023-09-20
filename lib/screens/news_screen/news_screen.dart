import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/models/news.dart';
import 'package:news/screens/news_screen/widgets/image_box.dart';

class NewsScreen extends StatelessWidget {
  final News? news;
  const NewsScreen({
    super.key,
    this.news,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            ImageBox(
              news: news,
            ),
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Text(
                  news?.body ?? '',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
