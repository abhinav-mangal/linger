import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:linger/cubits/profile_cubit/profile_cubit.dart';
import 'package:linger/data/data_repository/app_repository.dart';
import 'package:linger/locator.dart';
import 'package:linger/models/librarypage/libraryResponse.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:provider/src/provider.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit()
      : super(const LibraryState.init(
          loading: false,
          enabledSearch: false,
          books: [],
          audios: [],
        ));

  final dataRepo = getItInjector<AppRepository>();
  final appRoute = getItInjector<AppRouter>();
  void init() async {
    final authCubit =
        appRoute.navigatorKey.currentState!.context.read<ProfileCubit>();
    emit(state.copyWith(loading: true));
    final library = await dataRepo.getUserLibraries(
        token: authCubit.state.user?.token ?? '');
    emit(state.copyWith(loading: false));
    library.fold((l) {}, (r) {
      emit(state.copyWith(
        library: r,
        books: r?.books,
        audios: r?.audio,
      ));
    });
  }

  void onBookSearchStateChanged() {
    emit(state.copyWith(
      enabledSearch: !state.enabledSearch,
    ));
    emit(state.copyWith(
      books: state.library?.books,
      audios: state.library?.audio,
    ));
  }

  void onBookSearchChanged(String? value) {
    final currentBooks = [...?state.library?.books];
    final newList = <Books>[];
    for (var element in currentBooks) {
      if (element.bookName?.contains(value?.toLowerCase() ?? '') ?? false) {
        newList.add(element);
      }
    }
    emit(state.copyWith(
      books: newList,
    ));
  }
}
