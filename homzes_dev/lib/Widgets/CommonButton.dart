// ignore_for_file: file_names

import '../Configs/Common_Exports.dart';

Widget commonButton({
  required String text,
  required VoidCallback onPressed,
  Color? backgroundColor,
  Color textColor = Appcolors.WHITE,
  double borderRadius = 25.0,
  double fontSize = 16.0,
  double? btnWidth,
  double? btnHeight,
}) {
  return SizedBox(
    width: btnWidth,
    height: btnHeight,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontFamily: AppFonts.ROBOTOFLEX,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
