import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:linger/models/sukoon_subcategory_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Seerat_Subcategories extends StatefulWidget {
  final List<SubCategory> data;
  const Seerat_Subcategories({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<Seerat_Subcategories> createState() => _Seerat_SubcategoriesState();
}

class _Seerat_SubcategoriesState extends State<Seerat_Subcategories> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 0,
        title: const Text(
          'Sub Categories',
          style: TextStyle(
              fontFamily: 'Great Vibes',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: GridView.builder(
              physics: const ScrollPhysics(),
              itemCount: widget.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 3.15 / 1),
              itemBuilder: ((context, index) {
                return Center(
                  child: Card(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 1.03,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        widget.data[index].image!),
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            height: 50,
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.data[index].name!,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Hazarat Saad Bin',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 37,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}
