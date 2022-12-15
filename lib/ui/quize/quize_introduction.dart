import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/Dimension.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Utils/customText.dart';
import 'package:linger/cubits/questions/question_cubit.dart';

import '../widgets/primary_button.dart';
import 'home.dart';

class QuizIntroductionScreen extends StatefulWidget {
  const QuizIntroductionScreen({Key? key}) : super(key: key);

  @override
  State<QuizIntroductionScreen> createState() => _QuizIntroductionScreenState();
}

class _QuizIntroductionScreenState extends State<QuizIntroductionScreen>
    with baseclass {
  late final QuestionCubit questionCubit;
  String radioItem1 = "English";
  List<LangList> fList = [
    LangList(
      id: 0,
      name: "English",
    ),
    LangList(
      id: 1,
      name: "Hindi",
    ),
    LangList(
      id: 2,
      name: "Urdu",
    ),
    LangList(
      id: 3,
      name: "Arabic",
    ),
  ];
  int langid = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: getColorFromHex(ColorConstants.greyBackgroundScreen),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Slot 1',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: SizedBox(
            height: getHeight(context) * 0.8,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: CustomText(
                        text: "Quiz Note",
                        familytype: 1,
                        marginvalue: const EdgeInsets.only(top: 10, bottom: 10),
                        textsize: Dimension.text_twintyfive,
                        textcolor: getColorFromHex(ColorConstants.black),
                        textalign: TextAlign.start),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    // height:38,
                    // margin: const EdgeInsets.only(bottom:20),
                    decoration: BoxDecoration(
                      color: getColorFromHex(ColorConstants.white),
                      borderRadius: const BorderRadius.all(Radius.circular(60)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Language:',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'English',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.green.shade800,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Row(children: [
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Icon(
                                                              Icons.clear))),
                                                  Expanded(
                                                      flex: 4,
                                                      child: Container()),
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomText(
                                                        text: "Language",
                                                        familytype: 2,
                                                        textsize: Dimension
                                                            .text_large,
                                                        textcolor:
                                                            getColorFromHex(
                                                                ColorConstants
                                                                    .black),
                                                        textalign:
                                                            TextAlign.start),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Column(
                                              children: fList
                                                  .map((data) => RadioListTile(
                                                        activeColor:
                                                            getColorFromHex(
                                                                ColorConstants
                                                                    .green),
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                        title: Text(
                                                          data.name,
                                                          style: TextStyle(
                                                              color: radioItem1 ==
                                                                      data.name
                                                                  ? Colors.green
                                                                  : Colors
                                                                      .black,
                                                              fontWeight: radioItem1 ==
                                                                      data.name
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal),
                                                        ),
                                                        groupValue: langid,
                                                        value: data.id,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            radioItem1 =
                                                                data.name;
                                                            langid = data.id;
                                                          });
                                                        },
                                                      ))
                                                  .toList(),
                                            ),
                                          ],
                                        ))
                                  ]);
                                });
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: Colors.green.shade800,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: CustomText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At imperdiet et pellentesque euismod. Nunc sed risus sed cursus nunc vel posuere. Et suspendisse at et, scelerisque risus, amet tincidunt pretium condimentum.",
                      familytype: 1,
                      marginvalue: const EdgeInsets.all(10),
                      textsize: Dimension.text_large,
                      textcolor: getColorFromHex(ColorConstants.black),
                      textalign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PrimaryButton(
                    onTap: () {
                      // questionCubit.questionsQuiz(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Home()));
                    },
                    title: 'Get Started',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LangList {
  final String name;
  final int id;

  LangList({
    required this.name,
    required this.id,
  });
}
