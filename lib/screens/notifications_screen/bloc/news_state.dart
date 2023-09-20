part of 'news_bloc.dart';

@immutable
sealed class NewsState {
  const NewsState();
}

final class NewsDataState extends NewsState {
  final List<News> featuredNews;
  final List<News> latestNews;

  const NewsDataState({
    this.featuredNews = const [],
    this.latestNews = const [],
  });

  NewsDataState copyWith({
    List<News>? featuredNews,
    List<News>? latestNews,
  }) {
    return NewsDataState(
      featuredNews: featuredNews ?? this.featuredNews,
      latestNews: latestNews ?? this.latestNews,
    );
  }
}

final class NewsLoadingState extends NewsState {}

final class NewsErrorState extends NewsState {
  final String? message;

  const NewsErrorState({this.message});
}
