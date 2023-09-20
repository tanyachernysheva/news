part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {
  const NewsEvent();

  const factory NewsEvent.fetch() = _NewsFetchEvent;
}

final class _NewsFetchEvent implements NewsEvent {
  const _NewsFetchEvent();
}
