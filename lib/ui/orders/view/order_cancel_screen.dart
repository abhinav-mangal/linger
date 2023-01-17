import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/locator.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:linger/ui/orders/ordersscreen.dart';

import '../../../cubits/shop/shop_cubit.dart';

class OrderCancelScreen extends StatefulWidget {
  const OrderCancelScreen({Key? key, this.oid}) : super(key: key);
  final String? oid;

  @override
  State<OrderCancelScreen> createState() => _OrderCancelScreenState();
}

class _OrderCancelScreenState extends State<OrderCancelScreen> with baseclass {
  late final ShopCubit shopcubit;

  int selectedRadioTile = 0;

  @override
  void initState() {
    shopcubit = context.read<ShopCubit>();
    shopcubit.getOrderDetail(widget.oid ?? "");
    super.initState();
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  List<String> optionNames = [
    "Wrong Product",
    "Wrong Quantity",
    "Incorrect address",
    "Placed by mistake",
    // "Wrong product",
    // "Wrong product",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
      // if (state.loading ?? false) {
      //   return const ScreenContainer(
      //     title: '    ',
      //     leadingWidth: 0,
      //     leading: SizedBox(),
      //     child: Center(
      //       child: CircularProgressIndicator(),
      //     ),
      //   );
      // } else {
      // final vieworder = state.orderDetailModel?.data;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                final router = getItInjector<AppRouter>();
                router.pop();
                // setState(() {
                //   final router = getItInjector<AppRouter>();
                //   AppRouter.getParameters(Index: 0);
                //   router.pushAndPopUntil(const HomeRoute(),
                //       predicate: (Route<dynamic> route) {
                //     return false;
                //   });

                //   // Navigator.of(context).pushReplacement(
                //   //   MaterialPageRoute(
                //   //       builder: (context) => const HomePage(
                //   //             index: 0,
                //   //           )),
                //   // );
                // });
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: theme.textTheme.titleMedium?.color,
              )),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            Image.asset("assets/images/order_cancel_prop.png"),
            const SizedBox(height: 10),
            const Text("Choose Reason", style: TextStyle(fontSize: 28)),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.18),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: optionNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return RadioListTile(
                    value: index,
                    activeColor: Colors.green,
                    visualDensity:
                        const VisualDensity(horizontal: -4.0, vertical: -4.0),
                    title: Text(optionNames[index]),
                    groupValue: selectedRadioTile,
                    onChanged: (int? val) {
                      setState(() {
                        setSelectedRadioTile(val!);
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: Get.height * 0.075,
                  width: Get.width * 0.3,
                  child: FloatingActionButton.extended(
                    heroTag: "1",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                    backgroundColor: const Color(0xFFDE2222),
                    label: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: Get.height * 0.075,
                  width: Get.width * 0.3,
                  child: FloatingActionButton.extended(
                    heroTag: "2",
                    onPressed: () async {
                      await shopcubit.cancelOrderById(context, widget.oid!);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                    backgroundColor: const Color(0xFF1AA348),
                    label: const Text("Confirm"),
                  ),
                ),
              ],
            )
          ]),
        ),
      );
    }
        // },
        );
  }
}
