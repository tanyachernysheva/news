import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/news.dart';
import 'package:news/repositories/news_repo.dart';
import 'package:news/screens/news_screen/news_screen.dart';
import 'package:news/screens/notifications_screen/bloc/news_bloc.dart';
import 'package:news/screens/notifications_screen/widgets/carousel.dart';
import 'package:news/screens/notifications_screen/widgets/news_card.dart';

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
            onPressed: () {
              _bloc.add(const NewsEvent.markAllRead());
            },
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
                      horizontal: 18.0,
                      vertical: 18.0,
                    ),
                    child: Text(
                      'Featured',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Carousel(
                    news: <News>[
                      ...state.featuredNews,
                    ],
                    bloc: _bloc,
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                    ),
                    child: Text(
                      'Latest news',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 18.0,
                    ),
                    shrinkWrap: true,
                    itemCount: state.latestNews.length,
                    itemBuilder: (context, index) {
                      final news = state.latestNews[index];

                      return NewsCard(
                        news: news,
                        onTap: () {
                          _bloc.add(NewsEvent.latestIsRead(index));

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsScreen(news: news),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 18);
                    },
                  ),
                ],
              ),
            NewsLoadingState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            NewsErrorState() => Center(
                child: Text(state.message ?? ''),
              ),
          };
        },
      ),
    );
  }
}
