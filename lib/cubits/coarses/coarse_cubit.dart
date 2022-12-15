import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:linger/data/data_repository/app_repository.dart';
import 'package:linger/locator.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:loader_overlay/loader_overlay.dart';
part 'coarse_state.dart';

class CoarseCubit extends Cubit<CoarseState> {
  CoarseCubit() : super(CoarseState());

  final appRepo = getItInjector<AppRepository>();
  final appRoute = getItInjector<AppRouter>();

  init() async {
    appRoute.navigatorKey.currentState!.context.loaderOverlay.show();
    //final data = await appRepo.ge
  }
}
