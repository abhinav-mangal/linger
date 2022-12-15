part of 'library_cubit.dart';

class LibraryState extends Equatable {
  final LibraryResponseBody? library;
  final bool loading;
  final bool enabledSearch;
  final String? searchValue;
  final List<Books> books;
  final List<Audi> audios;

  const LibraryState({
    required this.enabledSearch,
    this.searchValue,
    this.library,
    required this.loading,
    required this.books,
    required this.audios,
  });

  const LibraryState.init({
    required this.enabledSearch,
    this.searchValue,
    this.library,
    required this.loading,
    required this.books,
    required this.audios,
  });

  LibraryState copyWith({
    LibraryResponseBody? library,
    bool? loading,
    bool? enabledSearch,
    String? searchValue,
    List<Books>? books,
    List<Audi>? audios,
  }) {
    return LibraryState(
      loading: loading ?? this.loading,
      library: library ?? this.library,
      enabledSearch: enabledSearch ?? this.enabledSearch,
      searchValue: searchValue ?? this.searchValue,
      books: books ?? this.books,
      audios: audios ?? this.audios,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        loading,
        library,
        enabledSearch,
        searchValue,
        books,
        audios,
      ];
}
