import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/models/news.dart';
import 'package:news/repositories/news_repo.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepo repo;
  NewsBloc({required this.repo}) : super(NewsLoadingState()) {
    on<_NewsFetchEvent>(_fetch);
    on<_NewsLatestIsReadEvent>(_setLatestIsRead);
    on<_NewsFeaturedIsReadEvent>(_setFeaturedIsRead);
    on<_NewsMarkAllReadEvent>(_markAllRead);
  }

  Future<void> _fetch(_NewsFetchEvent event, Emitter<NewsState> emit) async {
    try {
      emit(NewsLoadingState());

      final List<News> featuredNews = await repo.getFeaturedNews();
      final List<News> latestNews = await repo.getLatestNews();

      emit(NewsDataState(featuredNews: featuredNews, latestNews: latestNews));
    } catch (message, stackTrace) {
      emit(NewsErrorState(message: message.toString()));

      log(stackTrace.toString());
    }
  }

  void _setLatestIsRead(_NewsLatestIsReadEvent event, Emitter<NewsState> emit) {
    if (state is! NewsDataState) return;

    try {
      final int index = event.index;

      final List<News> newList = List.of((state as NewsDataState).latestNews);

      newList[index] = newList[index].copyWith(
        isRead: true,
      );

      emit((state as NewsDataState).copyWith(latestNews: newList));
    } catch (e) {
      emit(NewsErrorState(message: e.toString()));
    }
  }

  void _setFeaturedIsRead(
    _NewsFeaturedIsReadEvent event,
    Emitter<NewsState> emit,
  ) {
    if (state is! NewsDataState) return;

    try {
      final int index = event.index;

      final List<News> newList = List.of((state as NewsDataState).featuredNews);

      newList[index] = newList[index].copyWith(
        isRead: true,
      );

      emit((state as NewsDataState).copyWith(featuredNews: newList));
    } catch (e) {
      emit(NewsErrorState(message: e.toString()));
    }
  }

  void _markAllRead(_NewsMarkAllReadEvent event, Emitter<NewsState> emit) {
    try {
      final List<News> newFeaturedList =
          List.of((state as NewsDataState).featuredNews);
      final List<News> newLatestList =
          List.of((state as NewsDataState).latestNews);

      for (int i = 0; i < newFeaturedList.length; i++) {
        newFeaturedList[i] = newFeaturedList[i].copyWith(isRead: true);
      }
      for (int i = 0; i < newLatestList.length; i++) {
        newLatestList[i] = newLatestList[i].copyWith(isRead: true);
      }

      emit(
        (state as NewsDataState).copyWith(
          featuredNews: newFeaturedList,
          latestNews: newLatestList,
        ),
      );
    } catch (e) {
      emit(NewsErrorState(message: e.toString()));
    }
  }
}
