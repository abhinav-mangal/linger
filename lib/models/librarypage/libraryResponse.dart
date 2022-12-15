class LibraryResponse {
  bool? success;
  int? code;
  String? message;
  LibraryResponseBody? libraryResponseBody;

  LibraryResponse(
      {this.success, this.code, this.message, this.libraryResponseBody});

  LibraryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    libraryResponseBody = json['data'] != null
        ? LibraryResponseBody.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (libraryResponseBody != null) {
      data['data'] = libraryResponseBody!.toJson();
    }
    return data;
  }
}

class LibraryResponseBody {
  List<Audi>? audio;
  List<Books>? books;
  List<ContinueReading>? continueReading;

  LibraryResponseBody({this.audio, this.books, this.continueReading});

  LibraryResponseBody.fromJson(Map<String, dynamic> json) {
    if (json['audio'] != null) {
      audio = <Audi>[];
      json['audio'].forEach((v) {
        audio?.add(Audi.fromJson(v));
      });
    }
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books?.add(Books.fromJson(v));
      });
    }
    if (json['continue_reading'] != null) {
      continueReading = <ContinueReading>[];
      json['continue_reading'].forEach((v) {
        continueReading?.add(ContinueReading.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (audio != null) {
      data['audio'] = audio?.map((v) => v.toJson()).toList();
    }
    if (books != null) {
      data['books'] = books?.map((v) => v.toJson()).toList();
    }
    if (continueReading != null) {
      data['continue_reading'] =
          continueReading?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Audi {
  int? id;
  int? uid;
  String? title;
  String? icon;
  String? image;
  String? audio;
  String? createdAt;
  String? updatedAt;

  Audi(
      {this.id,
      this.uid,
      this.title,
      this.icon,
      this.image,
      this.audio,
      this.createdAt,
      this.updatedAt});

  Audi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    title = json['title'];
    icon = json['icon'];
    image = json['image'];
    audio = json['audio'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['title'] = title;
    data['icon'] = icon;
    data['image'] = image;
    data['audio'] = audio;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['book_name'] = bookName;
    data['book_arabic_name'] = bookArabicName;
    data['book_image'] = bookImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['book_author_name'] = bookAuthorName;
    return data;
  }
}

class ContinueReading {
  int? id;
  int? bookId;
  int? chapterId;
  int? language;
  String? createdAt;
  String? updatedAt;
  int? uid;

  ContinueReading(
      {this.id,
      this.bookId,
      this.chapterId,
      this.language,
      this.createdAt,
      this.updatedAt,
      this.uid});

  ContinueReading.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['book_id'];
    chapterId = json['chapter_id'];
    language = json['language'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['book_id'] = bookId;
    data['chapter_id'] = chapterId;
    data['language'] = language;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['uid'] = uid;
    return data;
  }
}
