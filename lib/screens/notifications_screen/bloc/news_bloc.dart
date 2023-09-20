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
}
