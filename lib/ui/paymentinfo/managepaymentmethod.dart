import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../morescreen.dart';
import 'creditcard.dart';

class DebitCreditCardScreen extends StatelessWidget with baseclass {
  final String name;
  final String accountNumber;
  const DebitCreditCardScreen(
      {Key? key, required this.name, required this.accountNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Decoration dec = BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1, color: Colors.white),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
    );

    return Container(
      margin: EdgeInsets.fromLTRB(4.6.w, 2.h, 4.6.w, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreditCardsPage(
            accountNumber: accountNumber,
            name: name,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 2.84.h, 0, 0),
              // padding:  EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.sp),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Moredetails(
                      'primary.png',
                      "Set as primary",
                      () {},
                      Icon(
                        Icons.arrow_forward_ios,
                        color: getColorFromHex(ColorConstants.greycolor)
                            .withOpacity(0.6),
                        size: 18.sp,
                      ),
                      true),
                  Moredetails(
                      'unbinding.png',
                      "Unbinding",
                      () {},
                      Icon(
                        Icons.arrow_forward_ios,
                        color: getColorFromHex(ColorConstants.greycolor)
                            .withOpacity(0.6),
                        size: 18.sp,
                      ),
                      true),
                ],
              )),
        ],
      ),
    );
  }
}

class ManagePaymentScreen extends StatefulWidget {
  const ManagePaymentScreen({Key? key}) : super(key: key);

  @override
  State<ManagePaymentScreen> createState() => _ManagePaymentScreenState();
}

class _ManagePaymentScreenState extends State<ManagePaymentScreen>
    with baseclass {
  late final TextEditingController _creditnumbercontroller =
      TextEditingController(text: '');
  late final TextEditingController _creditmonthcontroller =
      TextEditingController(text: '');
  late final TextEditingController _creditcvvcontroller =
      TextEditingController(text: '');
  late final TextEditingController _creditholdernamecontroller =
      TextEditingController(text: '');
  var separator = " ";
  Decoration dec = BoxDecoration(
    color: Colors.white,
    border: Border.all(width: 1, color: Colors.white),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 3,
        offset: const Offset(0, 1), // changes position of shadow
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void _onSearchButtonPressed() {
      Navigator.pop(context);
    }

    return BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 8.2.h,
          leading: IconButton(
              padding: EdgeInsets.fromLTRB(4.6.w, 0, 0, 0),
              onPressed: _onSearchButtonPressed,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20.sp,
              )),
          titleSpacing: 7.3.w,
          title: CustomText(
            text: 'Manage Payment Methods',
            familytype: 2,
            linecount: 1,
            textcolor: Colors.black,
            textsize: 20.sp,
            align: Alignment.centerLeft,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 8.2.w,
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: state.paymentMethods!
                    .where(
                        (el) => ((el.cardNumber != null) && (el.name != null)))
                    .toList()
                    .map((e) => DebitCreditCardScreen(
                          accountNumber: e.cardNumber!,
                          name: e.name!,
                        ))
                    .toList(),
              ),
            )),
      );
    });
  }
}

class UPICardcreen extends StatelessWidget with baseclass {
  final String upi;

  const UPICardcreen({Key? key, required this.upi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Decoration dec = BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1, color: Colors.white),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
    );

    return Container(
      margin: EdgeInsets.fromLTRB(4.6.w, 2.h, 4.6.w, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 2.84.h, 0, 0),
              // padding:  EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.sp),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Moredetails(
                      'card.png',
                      upi,
                      () {},
                      Icon(
                        Icons.arrow_forward_ios,
                        color: getColorFromHex(ColorConstants.greycolor)
                            .withOpacity(0.6),
                        size: 18.sp,
                      ),
                      true),
                ],
              )),
        ],
      ),
    );
  }
}

class ManageUPIScreen extends StatefulWidget {
  const ManageUPIScreen({Key? key}) : super(key: key);

  @override
  State<ManageUPIScreen> createState() => _ManageUPIScreenState();
}

class _ManageUPIScreenState extends State<ManageUPIScreen> with baseclass {
  late final TextEditingController _creditnumbercontroller =
      TextEditingController(text: '');
  late final TextEditingController _creditmonthcontroller =
      TextEditingController(text: '');
  late final TextEditingController _creditcvvcontroller =
      TextEditingController(text: '');
  late final TextEditingController _creditholdernamecontroller =
      TextEditingController(text: '');
  var separator = " ";
  Decoration dec = BoxDecoration(
    color: Colors.white,
    border: Border.all(width: 1, color: Colors.white),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 3,
        offset: const Offset(0, 1), // changes position of shadow
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void _onSearchButtonPressed() {
      Navigator.pop(context);
    }

    return BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 8.2.h,
          leading: IconButton(
              padding: EdgeInsets.fromLTRB(4.6.w, 0, 0, 0),
              onPressed: _onSearchButtonPressed,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20.sp,
              )),
          titleSpacing: 7.3.w,
          title: CustomText(
            text: 'Manage Payment Methods',
            familytype: 2,
            linecount: 1,
            textcolor: Colors.black,
            textsize: 20.sp,
            align: Alignment.centerLeft,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 8.2.w,
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: state.paymentMethods!
                    .where((el) => ((el.upi != null)))
                    .toList()
                    .map((e) => UPICardcreen(
                          upi: e.upi!,
                        ))
                    .toList(),
              ),
            )),
      );
    });
  }
}
