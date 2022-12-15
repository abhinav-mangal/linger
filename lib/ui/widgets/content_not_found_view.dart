import 'package:flutter/material.dart';

class NoContentFound extends StatelessWidget {
  const NoContentFound({Key? key, this.center}) : super(key: key);
  final bool? center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 40.00,
              right: 40.00,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.00,
                    right: 10.00,
                  ),
                  child: SizedBox(
                    height: 160.00,
                    width: 160.00,
                    child: Image.asset(
                      'assets/images/content_not_found.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.00,
                    top: 39.00,
                    right: 10.00,
                  ),
                  child: Text('Not content found',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
              ],
            ),
          ),
        ),
      ) ,
    )
      ;
  }
}
