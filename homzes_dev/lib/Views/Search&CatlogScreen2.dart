// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:homzes_dev/Controller/CatalogController.dart';
import '../Configs/Common_Exports.dart';

class SearchCatlogscreen2 extends StatelessWidget {
  const SearchCatlogscreen2({super.key});

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Appcolors.CARD_GREEN_3,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    final CatalogCtr = Get.put(CatalogController());

    return Scaffold(
      body: Column(
        children: <Widget>[
          // Top green box
          Container(
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(
              color: Appcolors.CARD_GREEN_3,
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
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Appcolors.BLACK,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Appcolors.WHITE,
                          size: 20,
                        ),
                      ),
                      Styles.sizedBoxW15,
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Appcolors.WHITE,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Transform.rotate(
                                angle: 1.7,
                                child: const Icon(
                                  Icons.search,
                                  color: Appcolors.BLACK,
                                ),
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
                      ),
                    ],
                  ),
                ),
                Styles.sizedBox15,
              ],
            ),
          ),

          // Bottom content
          Expanded(
            child: Column(
              children: <Widget>[
                Styles.sizedBox20,
                const Text(
                  "Popular rent offers",
                  style: TextStyle(
                    color: Appcolors.PRICE_TEXT_BLACK,
                    fontSize: 18,
                    fontFamily: AppFonts.ROBOTOFLEX,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: CatalogCtr.items.length,
                    itemBuilder: (context, index) {
                      try {
                        final item = CatalogCtr.items[index];
                        return singleVerticalImageCard(
                          context: context,
                          description: item['Title'] ?? '',
                          price: "\$ ${item['Price'] ?? '0'}",
                          image: item['Image'] ?? '',
                          beds: item['Number of beds']?.toString() ?? '',
                          bathrooms:
                              item['Number of bathrooms']?.toString() ?? '',
                          location: item['Location'] ?? '',
                          onTap: () {},
                        );
                      } catch (e) {
                        return const SizedBox.shrink();
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

Widget singleVerticalImageCard({
  required BuildContext context,
  required String description,
  required String image,
  required String price,
  String? beds,
  String? bathrooms,
  String? location,
  VoidCallback? onTap,
  VoidCallback? onFavoriteTap,
}) {
  return SizedBox(
    height: 300,
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
                    Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Row(
                        children: [
                          if (beds != null)
                            Container(
                              margin: const EdgeInsets.only(right: 6),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: const BoxDecoration(
                                color: Appcolors.WHITE,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                "$beds Beds",
                                style: const TextStyle(
                                  color: Appcolors.PRICE_TEXT_BLACK,
                                  fontSize: 12,
                                  fontFamily: AppFonts.ROBOTOFLEX,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          if (bathrooms != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: const BoxDecoration(
                                color: Appcolors.WHITE,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                "$bathrooms Bathrooms",
                                style: const TextStyle(
                                  color: Appcolors.PRICE_TEXT_BLACK,
                                  fontSize: 12,
                                  fontFamily: AppFonts.ROBOTOFLEX,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
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

        //bottom price row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  description,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Appcolors.PRICE_TEXT_BLACK,
                    fontSize: 16,
                    fontFamily: AppFonts.ROBOTOFLEX,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: price,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            fontFamily: AppFonts.ROBOTOFLEX,
                            color: Appcolors.PRICE_TEXT_BLACK,
                          ),
                        ),
                        const TextSpan(
                          text: " / mo",
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

        //gap
        Styles.sizedBox10,

        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              location!,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Appcolors.PRICE_TEXT_BLACK,
                fontSize: 12,
                fontFamily: AppFonts.ROBOTOFLEX,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
