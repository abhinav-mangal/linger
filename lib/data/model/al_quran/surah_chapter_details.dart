class SurahChaptersDetails {
  ChapterInfo? chapterInfo;

  SurahChaptersDetails({this.chapterInfo});

  SurahChaptersDetails.fromJson(Map<String, dynamic> json) {
    chapterInfo = json['chapter_info'] != null
        ? ChapterInfo.fromJson(json['chapter_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chapterInfo != null) {
      data['chapter_info'] = chapterInfo!.toJson();
    }
    return data;
  }
}

class ChapterInfo {
  int? id;
  int? chapterId;
  String? languageName;
  String? shortText;
  String? source;
  String? text;

  ChapterInfo(
      {this.id,
      this.chapterId,
      this.languageName,
      this.shortText,
      this.source,
      this.text});

  ChapterInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterId = json['chapter_id'];
    languageName = json['language_name'];
    shortText = json['short_text'];
    source = json['source'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chapter_id'] = chapterId;
    data['language_name'] = languageName;
    data['short_text'] = shortText;
    data['source'] = source;
    data['text'] = text;
    return data;
  }
}
