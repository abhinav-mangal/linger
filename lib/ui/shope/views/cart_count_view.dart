import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartCountButton extends StatelessWidget {
  const CartCountButton({Key? key, required this.count}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.blue,
        padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 23.sp,
            ),
            Positioned(
              top: -10,
              right: 1,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  count.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class CartCountButtonOnAppBar extends StatelessWidget {
  const CartCountButtonOnAppBar({Key? key, required this.count})
      : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.blue,
        padding: EdgeInsets.fromLTRB(4.w, 0, 8.w, 0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 23.sp,
            ),
            Positioned(
              top: 6,
              right: 1,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  count.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
