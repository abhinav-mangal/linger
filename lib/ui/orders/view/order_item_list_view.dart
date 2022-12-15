import 'package:flutter/material.dart';
import 'package:linger/data/model/my_order/datum.dart';
import './order_item_view.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key, required this.orderList}) : super(key: key);
  final OrderList orderList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: orderList.order
              ?.map(
                (data) => OrderItemView(
                    data.productImage.toString(),
                    data.productName,
                    '',
                    data.price.toString(),
                    data.quantity.toString()),
              )
              .toList() ??
          [],
    );
  }
}
