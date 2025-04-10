// ignore_for_file: non_constant_identifier_names, unused_local_variable, file_names

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Configs/Common_Exports.dart';
import '../Controller/CatalogController.dart';

class SearchCatlogscreen1 extends StatelessWidget {
  const SearchCatlogscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;

    //horizontal image card list
    final List<Map<String, dynamic>> horizontalImageCardItems = [
      {
        'description': 'Rent 3 room apartment in the center',
        'price': '\$580',
        'image': Images.BUILDING_IMAGE3,
      },
      {
        'description': 'Apartment 4 rooms',
        'price': '\$750',
        'image': Images.BUILDING_IMAGE2,
      },
      {
        'description': 'Apartment in the city center',
        'price': '\$800',
        'image': Images.BUILDING_IMAGE4,
      },
    ];

    //vertical image card list
    final List<Map<String, dynamic>> verticalImageCardItems = [
      {
        'description': 'Apartment 3 rooms',
        'rating': '',
        'price': '\$1250',
        'image': Images.BUILDING_IMAGE2,
      },
      {
        'description': 'Apartment 4 rooms',
        'rating': '',
        'price': '\$750',
        'image': Images.BUILDING_IMAGE2,
      },
      {
        'description': 'Apartment 5 rooms',
        'rating': '',
        'price': '\$800',
        'image': Images.BUILDING_IMAGE4,
      },
    ];

    final CatalogCtr = Get.put(CatalogController());

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Appcolors.CARD_YELLOW_2,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          //Top yellow box
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(
              color: Appcolors.CARD_YELLOW_2,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.sizedBox50,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu, color: Appcolors.BLACK, size: 28),
                      Row(
                        children: [
                          const Text(
                            "Hi, Stanislav",
                            style: TextStyle(
                              color: Appcolors.PRICE_TEXT_BLACK,
                              fontSize: 16,
                              fontFamily: AppFonts.ROBOTOFLEX,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Styles.sizedBoxW15,
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: Appcolors.CIRCLE_COLOR,
                                child: Text(
                                  'S',
                                  style: TextStyle(
                                    color: Appcolors.BLACK,
                                    fontFamily: AppFonts.ROBOTOFLEX,
                                    fontSize: Styles.FONT_SIZE_16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Appcolors.RED,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Appcolors.WHITE,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Styles.sizedBox15,

                // Search Box
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Appcolors.WHITE,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Transform.rotate(
                        angle: 1.7,
                        child: const Icon(Icons.search, color: Appcolors.BLACK),
                      ),
                      Styles.sizedBoxW15,
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontFamily: AppFonts.ROBOTOFLEX,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //Bottom
          Expanded(
            child: Column(
              children: <Widget>[
                //Gap
                Styles.sizedBox20,

                //Top row texts
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Featured",
                        style: TextStyle(
                          color: Appcolors.PRICE_TEXT_BLACK,
                          fontSize: 18,
                          fontFamily: AppFonts.ROBOTOFLEX,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () => CatalogCtr.ViewAllTextButton(),
                        child: const Text(
                          "View all",
                          style: TextStyle(
                            color: Appcolors.PRICE_TEXT_BLACK,
                            fontSize: 12,
                            fontFamily: AppFonts.ROBOTOFLEX,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Gap
                Styles.sizedBox15,

                //Images row
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: horizontalImageCardItems.length,
                    itemBuilder: (context, index) {
                      try {
                        return singleHorizontalImageCard(
                          description:
                              horizontalImageCardItems[index]['description'],
                          price: horizontalImageCardItems[index]['price'],
                          image: horizontalImageCardItems[index]['image'],
                          onTap: () {},
                        );
                      } catch (e) {
                        return Container();
                      }
                    },
                  ),
                ),

                //Gap
                Styles.sizedBox25,

                //Bottom row texts
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "New offers",
                        style: TextStyle(
                          color: Appcolors.PRICE_TEXT_BLACK,
                          fontSize: 18,
                          fontFamily: AppFonts.ROBOTOFLEX,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () => CatalogCtr.ViewAllTextButton(),
                        child: Text(
                          "View all",
                          style: TextStyle(
                            color: Appcolors.PRICE_TEXT_BLACK,
                            fontSize: 12,
                            fontFamily: AppFonts.ROBOTOFLEX,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Gap
                // Styles.sizedBox20,

                //Images Column
                Expanded(
                  child: ListView.builder(
                    itemCount: verticalImageCardItems.length,
                    itemBuilder: (context, index) {
                      try {
                        return singleVerticalImageCard(
                          description:
                              verticalImageCardItems[index]['description'],
                          price: verticalImageCardItems[index]['price'],
                          image: verticalImageCardItems[index]['image'],
                          onTap: () {},
                          context: context,
                        );
                      } catch (e) {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget singleHorizontalImageCard({
  required String description,
  required String image,
  required String price,
  VoidCallback? onTap,
}) {
  return SizedBox(
    height: 250,
    width: 150,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Image
                    Image.asset(image, fit: BoxFit.cover),

                    // Price Text
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: const BoxDecoration(
                          color: Appcolors.WHITE,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          price,
                          style: const TextStyle(
                            color: Appcolors.PRICE_TEXT_BLACK,
                            fontSize: 12,
                            fontFamily: AppFonts.ROBOTOFLEX,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            description,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Appcolors.PRICE_TEXT_BLACK,
              fontSize: 14,
              fontFamily: AppFonts.ROBOTOFLEX,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget singleVerticalImageCard({
  required BuildContext context,
  required String description,
  required String image,
  required String price,
  VoidCallback? onTap,
  VoidCallback? onFavoriteTap,
}) {
  return SizedBox(
    height: 270,
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 230,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Image
                    Image.asset(image, fit: BoxFit.cover),

                    // Price Text
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: const BoxDecoration(
                          color: Appcolors.WHITE,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          price,
                          style: const TextStyle(
                            color: Appcolors.PRICE_TEXT_BLACK,
                            fontSize: 12,
                            fontFamily: AppFonts.ROBOTOFLEX,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // Heart Icon
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: onFavoriteTap,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Appcolors.WHITE,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Description
              Expanded(
                child: Text(
                  description,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Appcolors.PRICE_TEXT_BLACK,
                    fontSize: 14,
                    fontFamily: AppFonts.ROBOTOFLEX,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Rating
              Row(
                children: [
                  const Icon(
                    Icons.star_border,
                    color: Appcolors.GREEN,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "4.9",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: AppFonts.ROBOTOFLEX,
                            color: Appcolors.PRICE_TEXT_BLACK,
                          ),
                        ),
                        TextSpan(
                          text: " (29 Reviews)",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: AppFonts.ROBOTOFLEX,
                            color: Appcolors.PRICE_TEXT_BLACK,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
