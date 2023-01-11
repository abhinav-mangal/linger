import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomEditText extends StatelessWidget {
  final String text;
  final Color textcolor;
  final double textsize;
  final int familytype;
  final TextAlign textalign;
  final String hint;
  Color hinttextcolor = Colors.grey;
  final double hinttextsize;
  final String righticonname;
  final String prefixtextval;
  TextEditingController? textcontroller;
  Function(String values)? validatemethod;
  Function(String)? onchangetext;
  var marginvalue;
  var paddingvalues;
  bool obscureText = false;
  var sufixwidget;
  var sufixiconwidget;
  var prefixwidget;
  var prefixiconwidget;
  var texttype;
  var linecount = 1;
  var wordlength;
  var height;
  bool enableeditmode = true;
  bool digit = false;
  double borderwidth = 0.0;
  Color bordercolor;
  Color fillColor;
  double borderradius = 0.0;
  var focusNode;
  var inputaction;
  final FontWeight? weight;

  var submitfuction;
  List<TextInputFormatter> inputform;
  void Function()? onTap;

  Function(String values)? checkmethod;
  final EdgeInsets? padding;
  
  bool readOnly = false;

  CustomEditText(
      {Key? key, this.text = "",
      this.height,
      this.textcolor = Colors.black,
      this.textsize = 14.0,
      this.familytype = 1,
      this.textalign = TextAlign.left,
      this.hint = "",
      this.hinttextsize = 14.0,
      this.hinttextcolor = Colors.grey,
      this.textcontroller,
      this.marginvalue,
      this.paddingvalues,
      this.obscureText = false,
      this.righticonname = "",
      this.sufixwidget,
      this.sufixiconwidget,
      this.texttype,
      this.linecount = 1,
      this.wordlength,
      this.onchangetext,
      this.fillColor = Colors.transparent,
      this.focusNode,
      this.inputaction,
      this.submitfuction,
      this.borderwidth = 0,
      this.bordercolor = Colors.transparent,
      this.borderradius = 0,
      this.prefixwidget,
      this.prefixiconwidget,
      this.enableeditmode = true,
      this.digit = false,
      this.prefixtextval = "",
      this.inputform = const [],
      this.validatemethod,
      this.weight,
      this.padding,
      this.readOnly = false,
      this.onTap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle tstyle =
        TextStyle(fontFamily: 'Bold', fontSize: textsize, color: textcolor);
    if (familytype == 1) {
      tstyle = TextStyle(
          fontFamily: 'Reguler', fontSize: textsize, color: textcolor);
    } else if (familytype == 2) {
      tstyle =
          TextStyle(fontFamily: 'Medium', fontSize: textsize, color: textcolor);
    } else if (familytype == 3) {
      tstyle =
          TextStyle(fontFamily: 'Bold', fontSize: textsize, color: textcolor);
    } else if (familytype == 4) {
      tstyle =
          TextStyle(fontFamily: 'Italic', fontSize: textsize, color: textcolor);
    } else if (familytype == 5) {
      tstyle =
          TextStyle(fontFamily: 'Light', fontSize: textsize, color: textcolor);
    }
    // TODO: implement build
    return Container(
        height: height,
        padding: paddingvalues,
        margin: marginvalue,
        child: TextFormField(
            // readOnly: true,
            //   initialValue: this.text,
            onFieldSubmitted: submitfuction,
            focusNode: focusNode,
            textInputAction: inputaction,
            enabled: enableeditmode,
            readOnly: readOnly,
            onTap: onTap,
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor,
              contentPadding: padding ?? const EdgeInsets.all(10.0),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                  color: hinttextcolor,
                  fontSize: hinttextsize,
                  fontWeight: weight),
              suffix: sufixwidget,
              suffixIcon: sufixiconwidget,
              prefix: prefixwidget,
              prefixIcon: prefixiconwidget,
              prefixIconConstraints:
                  const BoxConstraints(minHeight: 30, minWidth: 30),
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 30, minWidth: 30),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(borderradius - borderwidth)),
                  borderSide: const BorderSide(color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(borderradius - borderwidth)),
                  borderSide: const BorderSide(color: Colors.red)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderradius)),
                borderSide: BorderSide(color: bordercolor, width: borderwidth),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(borderradius - borderwidth)),
                  borderSide: BorderSide(color: bordercolor)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(borderradius - borderwidth)),
                  borderSide: BorderSide(color: bordercolor)),
            ),
            keyboardType: texttype,
            maxLines: linecount,
            //maxLength: wordlength,
            onChanged: onchangetext,
            obscureText: obscureText,
            controller: textcontroller,
            textAlign: textalign,
            validator: checkfun,
            inputFormatters: inputform,
            style: tstyle));

    //throw UnimplementedError();
  }

  String? checkfun(value) {
    // ignore: top_level_function_literal_block
    if (validatemethod != null) {
      return validatemethod!(value.toString().trim());
    } else {
      return null;
    }
  }

  checkvalidater(String values) {
    validatemethod!(values.trim());
  }

  void sendmessage(String messsage) {}
}
