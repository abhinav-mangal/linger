import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_repository/app_repository.dart';
import '../../locator.dart';
import '../../models/librarypage/bookReponse.dart';
import '../../router/app_routes.gr.dart';
import '../profile_cubit/profile_cubit.dart';

part 'chapter_state.dart';

class ChapterCubit extends Cubit<ChapterState> {
  ChapterCubit()
      : super(const ChapterState.init(
          loading: false,
          enabledSearch: false,
          books: [],
          chapter: [],
        ));
  final dataRepo = getItInjector<AppRepository>();
  final appRoute = getItInjector<AppRouter>();
  void init() async {
    final authCubit =
        appRoute.navigatorKey.currentState!.context.read<ProfileCubit>();
    emit(state.copyWith(loading: true));
    final book = await dataRepo.getBookDetail(
        token: authCubit.state.user?.token ?? '',
        languageId: state.languageid ?? '',
        chapterId: state.chapterid ?? '',
        bookId: state.bookid ?? '');
    emit(state.copyWith(loading: false));
    book.fold((l) {}, (r) {
      emit(state.copyWith(
        bookResponseBody: r,
        books: r?.books,
        chapter: r?.chapter,
      ));
    });
  }

  void onBookSearchStateChanged() {
    emit(state.copyWith(
      enabledSearch: !state.enabledSearch,
    ));
    emit(state.copyWith(
      books: state.books,
      chapter: state.chapter,
    ));
  }

  void onBookSearchChanged(String? value) {
    final currentChapter = [...?state.chapter];
    final newList = <Chapter>[];
    for (var element in currentChapter) {
      if (element.description?.contains(value?.toLowerCase() ?? '') ?? false) {
        newList.add(element);
      }
    }
    emit(state.copyWith(
      chapter: newList,
    ));
  }

  void onlanguageChanged(String? value) {
    emit(state.copyWith(languageid: value));
  }

  void onchapterChanged(String? value) {
    emit(state.copyWith(chapterid: value));
  }

  void onbookChanged(String? value) {
    emit(state.copyWith(bookid: value));
  }
}
