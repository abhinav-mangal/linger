part of 'wallet_cubit.dart';

class WalletState extends Equatable {
  final WalletResponseBody? wallet;
  final bool loading;

  const WalletState({
    this.wallet,
    required this.loading,
  });

  const WalletState.init({
    this.wallet,
    required this.loading,
  });

  WalletState copyWith({
    WalletResponseBody? wallet,
    bool? loading,
  }) {
    return WalletState(
      loading: loading ?? this.loading,
      wallet: wallet ?? this.wallet,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        loading,
        wallet,
      ];
}
