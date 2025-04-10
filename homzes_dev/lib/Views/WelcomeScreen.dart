// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/services.dart';

import '../Configs/Common_Exports.dart';
import '../Widgets/CommonButton.dart';
import 'Search&CatlogScreen1.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    final List<Map<String, dynamic>> cardItems = [
      {'title': 'Rent', 'image': Images.RENT, 'color': Appcolors.CARD_YELLOW_1},
      {'title': 'Buy', 'image': Images.BUY, 'color': Appcolors.CARD_YELLOW_2},
      {'title': 'Sell', 'image': Images.BUY, 'color': Appcolors.CARD_GREEN_3},
    ];

    return Scaffold(
      body: Container(
        height: ScreenHeight,
        width: ScreenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.WELCOMESCREEN_IMAGE),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Appcolors.PRIMARY_BLACK,
          child: Column(
            children: <Widget>[
              //upper box
              SizedBox(
                height: ScreenHeight / 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: ScreenHeight / 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Homzes',
                            style: TextStyle(
                              color: Appcolors.WHITE,
                              fontFamily: AppFonts.ROBOTOFLEX,
                              fontSize: Styles.FONT_SIZE_28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Appcolors.TRANSPARENT,
                              shape: BoxShape.circle,
                              border: Border.all(color: Appcolors.WHITE),
                            ),
                            child: const Icon(
                              Icons.menu,
                              color: Appcolors.WHITE,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom box
              SizedBox(
                height: ScreenHeight / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Find the best \nplace for you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Appcolors.WHITE,
                        fontSize: Styles.FONT_SIZE_36,
                        fontFamily: AppFonts.ROBOTOFLEX,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Styles.sizedBox25,
                    SizedBox(
                      height: 172,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cardItems.length,
                        itemBuilder: (context, index) {
                          try {
                            return commonCard(
                              title: cardItems[index]['title'],
                              image: cardItems[index]['image'],
                              color: cardItems[index]['color'],
                              onTap: () {},
                            );
                          } catch (e) {
                            return Container();
                          }
                        },
                      ),
                    ),
                    Styles.sizedBox25,
                    commonButton(
                      text: "Create an account",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchCatlogscreen1(),
                          ),
                        );
                      },
                      backgroundColor: Appcolors.BUTTON_GREEN,
                      textColor: Appcolors.WHITE,
                      btnHeight: 50,
                      btnWidth: 350,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget commonCard({
  required String title,
  required String image,
  required Color color,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 160,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        color: color,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Appcolors.WHITE,
                  shape: BoxShape.circle,
                  border: Border.all(color: Appcolors.WHITE),
                ),
                child: Image.asset(image),
              ),

              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  fontFamily: AppFonts.ROBOTOFLEX,
                  color: Appcolors.CARD_TEXT_COLOR,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
