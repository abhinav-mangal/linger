class BookResponse {
  bool? success;
  int? code;
  String? message;
  BookResponseBody? data;

  BookResponse({this.success, this.code, this.message, this.data});

  BookResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? new BookResponseBody.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BookResponseBody {
  List<Books>? books;
  List<Chapter>? chapter;
  List<Null>? pages;

  BookResponseBody({this.books, this.chapter, this.pages});

  BookResponseBody.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
    if (json['chapter'] != null) {
      chapter = <Chapter>[];
      json['chapter'].forEach((v) {
        chapter!.add(new Chapter.fromJson(v));
      });
    }
    if (json['pages'] != null) {
      pages = <Null>[];
      // json['pages'].forEach((v) {
      //   pages!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    if (this.chapter != null) {
      data['chapter'] = this.chapter!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      // data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  int? id;
  int? uid;
  String? bookName;
  String? bookArabicName;
  String? bookImage;
  String? createdAt;
  String? updatedAt;
  String? bookAuthorName;

  Books(
      {this.id,
      this.uid,
      this.bookName,
      this.bookArabicName,
      this.bookImage,
      this.createdAt,
      this.updatedAt,
      this.bookAuthorName});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    bookName = json['book_name'];
    bookArabicName = json['book_arabic_name'];
    bookImage = json['book_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bookAuthorName = json['book_author_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['book_name'] = this.bookName;
    data['book_arabic_name'] = this.bookArabicName;
    data['book_image'] = this.bookImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['book_author_name'] = this.bookAuthorName;
    return data;
  }
}

class Chapter {
  int? id;
  int? uid;
  String? bookId;
  String? chapterName;
  String? description;
  String? createdAt;
  String? updatedAt;

  Chapter(
      {this.id,
      this.uid,
      this.bookId,
      this.chapterName,
      this.description,
      this.createdAt,
      this.updatedAt});

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    bookId = json['book_id'];
    chapterName = json['chapter_name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['book_id'] = this.bookId;
    data['chapter_name'] = this.chapterName;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
