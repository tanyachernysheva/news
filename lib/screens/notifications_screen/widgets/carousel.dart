import 'package:flutter/material.dart';
import 'package:news/models/news.dart';
import 'package:news/screens/news_screen/news_screen.dart';

class Carousel extends StatefulWidget {
  final List<News> news;

  const Carousel({
    super.key,
    required this.news,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount:
            widget.news.fold(0, (p, c) => p! + (c.image != null ? 1 : 0)),
        itemBuilder: (context, index) {
          final newsObj = widget.news[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsScreen(news: newsObj)));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    newsObj.image ?? '',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(106, 0, 0, 0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        newsObj.title ?? '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
