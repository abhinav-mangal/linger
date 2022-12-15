import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/data/model/wallet_response_model.dart';

import '../../data/data_repository/app_repository.dart';
import '../../locator.dart';
import '../../router/app_routes.gr.dart';
import '../profile_cubit/profile_cubit.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit()
      : super(const WalletState.init(
          loading: false,
        ));
  final dataRepo = getItInjector<AppRepository>();
  final appRoute = getItInjector<AppRouter>();
  void init() async {
    final authCubit =
        appRoute.navigatorKey.currentState!.context.read<ProfileCubit>();
    emit(state.copyWith(loading: true));
    final wallet =
        await dataRepo.getWallet(token: authCubit.state.user?.token ?? '');
    emit(state.copyWith(loading: false));
    wallet.fold((l) {}, (r) {
      emit(state.copyWith(
        wallet: r,
      ));
    });
  }
}
