import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/profile_cubit/profile_cubit.dart';
import '../../data/data_repository/app_repository.dart';
import '../../data/model/user_question_response_model.dart';
import '../../locator.dart';
import '../../router/app_routes.gr.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(const QuestionState.init(loading: false));
  final dataRepo = getItInjector<AppRepository>();
  final appRoute = getItInjector<AppRouter>();
  void questionsQuiz(BuildContext context) async {
    final authCubit =
        appRoute.navigatorKey.currentState!.context.read<ProfileCubit>();
    emit(state.copyWith(loading: true));
    final questions = await dataRepo.getQuestions(
        token: authCubit.state.user?.token ?? '', languageId: "3");
    emit(state.copyWith(loading: false));
    questions.fold((l) {}, (r) {
      emit(state.copyWith(questions: r));
    });
  }
}
