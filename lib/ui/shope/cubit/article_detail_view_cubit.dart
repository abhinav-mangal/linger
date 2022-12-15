import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/ui/shope/views/article_view.dart';
import '../../../cubits/profile_cubit/profile_cubit.dart';
import '../../../cubits/shop/shop_cubit.dart';
import '../../../data/data_repository/app_repository.dart';
import '../../../data/model/my_cart/cart.dart';
import '../../../data/model/shop_dashboard_model/article.dart';
import '../../../data/model/shop_dashboard_model/shop_dashboard_model.dart';
import '../../../locator.dart';
import '../../../router/app_routes.gr.dart';

class ArticleViewCubit extends Cubit<ArticleViewState> {
  ArticleViewCubit() : super(ArticleViewState.initial(
      loading: false, processing: false));
  final route = getItInjector<AppRouter>();
  String? myToken;
  final dataRepo = getItInjector<AppRepository>();
  void getArticleDetail(String productId) async {
    final authCubit = route.navigatorKey.currentContext!.read<ProfileCubit>();
    myToken = authCubit.state.user?.token ?? '';
    emit(state.copyWith(
      loading: true,
    ));
    emit(state.copyWith(
      cart: route.navigatorKey.currentContext!.read<ShopCubit>().state.cart,
    ));

    final res = await dataRepo.getArticleDetails(
      token: myToken ?? '',
      productId: productId,
    );

    emit(state.copyWith(
      loading: false,
    ));

    res.fold((l) {}, (r) {
      if (r != null && r.data != null) {
        emit(state.copyWith(
          shopDashboardModel: r,
        ));
        // setData(r.data!);
      }
    });
  }
}

class ArticleViewState extends Equatable {
  final bool processing;
  final bool loading;
  final ShopDashboardModel ? shopDashboardModel;
  final List<Cart>? cart;

  const ArticleViewState({
    required this.loading,
    required this.processing,
    this.shopDashboardModel,
    this.cart,
  });

  const ArticleViewState.initial({
    required this.loading,
    required this.processing,
    this.shopDashboardModel,
    this.cart,
  });

  ArticleViewState copyWith({
    bool ?processing,
    bool ?loading,
    ShopDashboardModel ?shopDashboardModel,
    List<Cart>? cart,
  }) {
    return ArticleViewState(
      processing: processing ?? this.processing,
      loading: loading ?? this.loading,
      shopDashboardModel:shopDashboardModel?? this.shopDashboardModel,
        cart:cart??this.cart,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    loading,
    processing,
    shopDashboardModel,
    cart,
  ];
}
