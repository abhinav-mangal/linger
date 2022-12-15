part of 'question_cubit.dart';

class QuestionState extends Equatable {
  final bool loading;
  final QuestionsModel? questions;
  const QuestionState({this.questions, required this.loading});

  const QuestionState.init({this.questions, required this.loading});

  QuestionState copyWith({
    QuestionsModel? questions,
    bool? loading,
  }) {
    return QuestionState(
      loading: loading ?? this.loading,
      questions: questions ?? this.questions,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        loading,
        questions,
      ];
}
