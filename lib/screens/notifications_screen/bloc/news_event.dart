part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {
  const NewsEvent();

  const factory NewsEvent.fetch() = _NewsFetchEvent;
  const factory NewsEvent.latestIsRead(int index) = _NewsLatestIsReadEvent;
  const factory NewsEvent.featuredIsRead(int index) = _NewsFeaturedIsReadEvent;
  const factory NewsEvent.markAllRead() = _NewsMarkAllReadEvent;
}

final class _NewsFetchEvent implements NewsEvent {
  const _NewsFetchEvent();
}

final class _NewsLatestIsReadEvent implements NewsEvent {
  final int index;
  const _NewsLatestIsReadEvent(this.index);
}

final class _NewsFeaturedIsReadEvent implements NewsEvent {
  final int index;
  const _NewsFeaturedIsReadEvent(this.index);
}

final class _NewsMarkAllReadEvent implements NewsEvent {
  const _NewsMarkAllReadEvent();
}
