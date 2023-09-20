import 'package:flutter/material.dart';
import 'package:news/models/news.dart';

class NewsCard extends StatelessWidget {
  final News? news;
  final void Function()? onTap;

  const NewsCard({super.key, this.news, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.white,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                offset: Offset(5, 5),
              ),
              BoxShadow(
                color: Colors.white,
                blurRadius: 5.0,
                offset: Offset(-5, -5),
              ),
            ],
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(news?.image ?? ''),
            ),
            title: Text(news?.title ?? ''),
            subtitle: Text(news?.posted ?? ''),
            subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
            onTap: onTap,
          ),
        ),
        if (news?.isRead == true)
          const Positioned(
            right: 8,
            bottom: 0,
            child: Chip(
              backgroundColor: Colors.transparent,
              label: Icon(Icons.check),
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}
