part of 'chapter_cubit.dart';

class ChapterState extends Equatable {
  final BookResponseBody? bookResponseBody;
  final bool loading;
  final String? chapterid;
  final String? bookid;
  final String? languageid;
  final bool enabledSearch;
  final String? searchValue;
  final List<Books> books;
  final List<Chapter> chapter;

  const ChapterState({
    required this.enabledSearch,
    this.searchValue,
    this.bookResponseBody,
    this.chapterid,
    this.bookid,
    this.languageid,
    required this.loading,
    required this.books,
    required this.chapter,
  });

  const ChapterState.init({
    required this.enabledSearch,
    this.searchValue,
    this.bookResponseBody,
    this.chapterid,
    this.bookid,
    this.languageid,
    required this.loading,
    required this.books,
    required this.chapter,
  });

  ChapterState copyWith({
    BookResponseBody? bookResponseBody,
    bool? loading,
    bool? enabledSearch,
    String? chapterid,
    String? bookid,
    String? languageid,
    String? searchValue,
    List<Books>? books,
    List<Chapter>? chapter,
  }) {
    return ChapterState(
      loading: loading ?? this.loading,
      bookResponseBody: bookResponseBody ?? this.bookResponseBody,
      enabledSearch: enabledSearch ?? this.enabledSearch,
      searchValue: searchValue ?? this.searchValue,
      chapterid: chapterid ?? this.chapterid,
      bookid: bookid ?? this.bookid,
      languageid: languageid ?? this.languageid,
      books: books ?? this.books,
      chapter: chapter ?? this.chapter,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        loading,
        bookResponseBody,
        enabledSearch,
        searchValue,
        chapterid,
        bookid,
        languageid,
        books,
        chapter,
      ];
}
