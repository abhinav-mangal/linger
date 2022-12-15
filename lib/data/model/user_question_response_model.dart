class UserQuestionsResponseModel {
  bool? success;
  int? code;
  String? message;
  QuestionsModel? data;

  UserQuestionsResponseModel(
      {this.success, this.code, this.message, this.data});

  UserQuestionsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? QuestionsModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class QuestionsModel {
  List<Question>? question;
  int? numberOfQuestion;

  QuestionsModel({this.question, this.numberOfQuestion});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    if (json['Question'] != null) {
      question = <Question>[];
      json['Question'].forEach((v) {
        question!.add(Question.fromJson(v));
      });
    }
    numberOfQuestion = json['number_of_question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (question != null) {
      data['Question'] = question!.map((v) => v.toJson()).toList();
    }
    data['number_of_question'] = numberOfQuestion;
    return data;
  }
}

class Question {
  int? id;
  String? question;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? answer;

  Question(
      {this.id,
      this.question,
      this.optionA,
      this.optionB,
      this.optionC,
      this.optionD,
      this.answer});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    optionA = json['option_a'];
    optionB = json['option_b'];
    optionC = json['option_c'];
    optionD = json['option_d'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['option_a'] = optionA;
    data['option_b'] = optionB;
    data['option_c'] = optionC;
    data['option_d'] = optionD;
    data['answer'] = answer;
    return data;
  }
}
