import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Basepackage/baseclass.dart';
import '../../Utils/CustomEdits.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen>
    with baseclass {
  late TextEditingController _namecontroller = TextEditingController(text: '');
  late TextEditingController _postalcontroller =
      TextEditingController(text: '');
  late TextEditingController _addresscontroller =
      TextEditingController(text: '');
  late TextEditingController _mobilecontroller =
      TextEditingController(text: '');
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String Radioitem = "";
  late final ShopCubit shopCubit;
  void _onSearchButtonPressed() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    shopCubit = context.read<ShopCubit>();
    _namecontroller = TextEditingController(text: '');
    _postalcontroller = TextEditingController(text: '');
    _addresscontroller = TextEditingController(text: '');
    _mobilecontroller = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: getColorFromHex(ColorConstants.greyBackgroundScreen),
          appBar: AppBar(
            toolbarHeight: 8.2.h,
            leading: IconButton(
                padding: EdgeInsets.fromLTRB(4.6.w, 0, 0, 0),
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20.sp,
                )),
            titleSpacing: 7.3.w,
            title: CustomText(
              text: 'Shipping Address',
              familytype: 2,
              linecount: 1,
              textcolor: Colors.black,
              textsize: 20.sp,
              align: Alignment.centerLeft,
            ),
            elevation: 0,
            backgroundColor:
                getColorFromHex(ColorConstants.greyBackgroundScreen),
            leadingWidth: 8.2.w,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(
                  left: 4.6.w, right: 4.6.w, top: 2.8.h, bottom: 2.8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 7.2.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: getColorFromHex(ColorConstants.greycolor)
                                .withOpacity(0.25)),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: CustomEditText(
                      // text: 'l',
                      textcontroller: _namecontroller,
                      hint: "Enter name",
                      hinttextsize: 16.sp,
                      hinttextcolor: getColorFromHex(ColorConstants.grey),
                      familytype: 1,
                      textcolor: getColorFromHex(ColorConstants.black),
                      textsize: 16.sp,
                      textalign: TextAlign.left,
                      onchangetext: (value) {
                        if (value.isEmpty) {
                          // _rereshchats();
                        }
                      },
                      // submitfuction:Search,
                      bordercolor: Colors.transparent,
                      borderradius: 0,
                      borderwidth: 0,
                    ),
                  ),
                  Container(
                    height: 7.2.h,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: getColorFromHex(ColorConstants.greycolor)
                                    .withOpacity(0.25),
                                width: 1.0))),
                    alignment: Alignment.center,
                    child: InternationalPhoneNumberInput(
                      maxLength: 10,
                      hintText: "Enter your phone number",
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: const SelectorConfig(
                        leadingPadding: 0,
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(
                          color: getColorFromHex(ColorConstants.black),
                          fontSize: 16.sp),
                      initialValue: number,
                      textStyle: TextStyle(
                          color: getColorFromHex(ColorConstants.black),
                          fontSize: 16.sp),
                      textFieldController: _mobilecontroller,
                      formatInput: false,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputBorder: InputBorder.none,
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),
                  Container(
                    height: 7.2.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: getColorFromHex(ColorConstants.greycolor)
                                .withOpacity(0.25)),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: CustomEditText(
                      // text: '9',
                      digit: true,
                      wordlength: 6,
                      hint: "Enter postcode",
                      hinttextcolor: getColorFromHex(ColorConstants.grey),
                      hinttextsize: 16.sp,
                      familytype: 1,
                      textcolor: getColorFromHex(ColorConstants.black),
                      textsize: 16.sp,
                      textalign: TextAlign.left,
                      onchangetext: (value) {},
                      bordercolor: Colors.transparent,
                      textcontroller: _postalcontroller,
                      borderradius: 0,
                      borderwidth: 0,
                    ),
                  ),
                  Container(
                    height: 7.2.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: getColorFromHex(ColorConstants.greycolor)
                                .withOpacity(0.25)),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: CustomEditText(
                      // text: '9',
                      hint: "Enter address",
                      hinttextcolor: getColorFromHex(ColorConstants.grey),
                      hinttextsize: 16.sp,
                      familytype: 1,
                      textcolor: getColorFromHex(ColorConstants.black),
                      textsize: 16.sp,

                      textalign: TextAlign.left,
                      onchangetext: (value) {},
                      bordercolor: Colors.transparent,
                      textcontroller: _addresscontroller,
                      borderradius: 0,
                      borderwidth: 0,
                    ),
                  ),
                  Column(
                    children: [
                      SelectState(
                        onCountryChanged: (value) {
                          setState(() {
                            countryValue = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            stateValue = value;
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            cityValue = value;
                          });
                        },
                        style: TextStyle(
                            color: getColorFromHex(ColorConstants.black),
                            fontSize: 16.sp),
                      ),
                    ],
                  ),
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    groupValue: Radioitem,
                    activeColor: getColorFromHex(ColorConstants.green),
                    title: CustomText(
                      text: 'Set as default',
                      familytype: 1,
                      linecount: 1,
                      textcolor: Colors.black,
                      textsize: 16.sp,
                      align: Alignment.centerLeft,
                    ),
                    value: 'Item 2',
                    onChanged: (val) {
                      setState(() {
                        Radioitem = val.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              shopCubit.setAddress(context,
                  address: _addresscontroller.text,
                  name: _namecontroller.text,
                  city: cityValue,
                  country: countryValue,
                  mobileNumber: _mobilecontroller.text,
                  passcode: _postalcontroller.text,
                  stateStr: stateValue,
                  status: Radioitem != "" ? "1" : "0");
            },
            child: Container(
              width: 100.w,
              height: 5.9.h,
              margin: EdgeInsets.fromLTRB(4.6.w, 4.7.h, 4.6.w, 4.7.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: getColorFromHex(ColorConstants.green),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Save',
                style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontFamily: 'SemiBold'),
              ),
            ),
          ),
        );
      },
    );
  }
}
