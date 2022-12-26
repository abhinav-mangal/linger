import 'package:flutter/material.dart';

class SeeratFavorite extends StatefulWidget {
  const SeeratFavorite({Key? key, }) : super(key: key);

  @override
  State<SeeratFavorite> createState() => _SeeratFavoriteState();
}

class _SeeratFavoriteState extends State<SeeratFavorite> {
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
          'Favorites',
          style: TextStyle(
              fontFamily: 'Great Vibes',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          child: GridView.builder(
              physics: ScrollPhysics(),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                    image: AssetImage(
                                        'assets/images/cardimage.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            height: 50,
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Seerat a Sahaba',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Hazarat Saad Bin',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
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
