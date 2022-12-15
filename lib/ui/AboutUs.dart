import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  String abc = 'abc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'API',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () async {
              var url = Uri.parse(
                  'https://goquotes-api.herokuapp.com/api/v1/random?count=1');
              var response = await http.get(url);
              print(response.body);
              // print('Response status: ${response.statusCode}');
              // print('Response body: ${response.body}');
              const JsonEncoder encoder = JsonEncoder.withIndent('  ');
              Map<String, dynamic> user = jsonDecode(response.body);
              print('Howdy, ${user['quotes'][0]['text']}!');
              setState(() {
                abc = user['quotes'][0]['text'];
              });
              print('We sent the verification link to ${user['email']}.');
            },
            child: Container(
              width: 500.0,
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
              color: Colors.green,
              child: Column(children: [
                Text(abc),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
