import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/news.dart';
import 'package:news/repositories/news_repo.dart';
import 'package:news/screens/notifications_screen/bloc/news_bloc.dart';
import 'package:news/screens/notifications_screen/widgets/carousel.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late final NewsBloc _bloc;
  @override
  void initState() {
    _bloc = NewsBloc(repo: FakeNewsRepo());

    _bloc.add(const NewsEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        leading: const BackButton(),
        title: const Text('Notifications'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text('Mark all read'),
          ),
        ],
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        bloc: _bloc,
        builder: (context, state) {
          return switch (state) {
            NewsDataState() => ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28.0,
                      vertical: 18.0,
                    ),
                    child: Text(
                      'Featured',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Carousel(
                    news: <News>[
                      ...?state.featuredNews,
                    ],
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28.0,
                    ),
                    child: Text(
                      'Latest news',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28.0,
                      vertical: 18.0,
                    ),
                    shrinkWrap: true,
                    itemCount: state.latestNews?.length ?? 0,
                    itemBuilder: (context, index) {
                      return NewsCard(news: state.latestNews?[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 18);
                    },
                  )
                ],
              ),
            NewsLoadingState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            NewsErrorState() => const SizedBox(),
          };
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final News? news;

  const NewsCard({
    super.key,
    this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onTap: () {},
      ),
    );
  }
}
