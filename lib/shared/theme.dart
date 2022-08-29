import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

Color mainColor = "F7941C".toColor();
Color greyColor = "D9D9D9".toColor();
Color iconColor = "50BBDB".toColor();
Color appBarColor = "A3C332".toColor();
Color pageDefaultColor = "F6F6F6".toColor();
Color borderDefaultColor = "BDBDBD".toColor();
Color greyDefaultColor = "EAEAEA".toColor();
Color greyBorderColor = "606060".toColor();
Color greyInputColor = "F1F3F4".toColor();
Color greyTextTitleColor = "747474".toColor();
Color errorDefaultColor = "FF0000".toColor();
Color errorBackroundColor = "F9E5E6".toColor();
Color blueDefaultColor = "81D4FA".toColor();
Color blueBackroundColor = "E1F5FE".toColor();
Color blueProfilColor = "D5EBF6".toColor();
Color orangeNewsColor = "FDAC02".toColor();
var fontType = GoogleFonts.roboto();

Widget loadingIndicator = SpinKitCubeGrid(
  size: 45,
  color: mainColor,
);

TextStyle greyFontStyle =
    fontType.copyWith(color: Colors.grey[600], fontSize: 16);
TextStyle greyFontStyle2 =
    fontType.copyWith(color: "737373".toColor(), fontSize: 16);

TextStyle greyBoldFontStyle10 = fontType.copyWith(
    color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold);
TextStyle greyBoldFontStyle11 = fontType.copyWith(
    color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold);
TextStyle greyBoldFontStyle12 = fontType.copyWith(
    color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold);
TextStyle greyBoldFontStyle14 = fontType.copyWith(
    color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold);
TextStyle greyBoldFontStyle16 = fontType.copyWith(
    color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold);
TextStyle greyBoldFontStyle35 = fontType.copyWith(
    color: Colors.grey, fontSize: 35, fontWeight: FontWeight.bold);
TextStyle greyFontStyle12 = fontType.copyWith(color: Colors.grey, fontSize: 12);
TextStyle greyFontStyle14 = fontType.copyWith(color: Colors.grey, fontSize: 14);
TextStyle greyFontStyle16 = fontType.copyWith(color: Colors.grey, fontSize: 16);
TextStyle greyFontStyle30 = fontType.copyWith(color: Colors.grey, fontSize: 30);

TextStyle greyBoldFontTitleStyle22 = fontType.copyWith(
    color: greyTextTitleColor, fontSize: 22, fontWeight: FontWeight.bold);

TextStyle whiteFontStyle12 =
    fontType.copyWith(color: Colors.white, fontSize: 12);
TextStyle whiteBoldFontStyle12 = fontType.copyWith(
    color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold);
TextStyle whiteFontStyle14 =
    fontType.copyWith(color: Colors.white, fontSize: 14);
TextStyle whiteBoldFontStyle14 = fontType.copyWith(
    color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold);
TextStyle whiteBoldUnderlineFontStyle14 = fontType.copyWith(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
);
TextStyle whiteFontStyle16 =
    fontType.copyWith(color: Colors.white, fontSize: 16);
TextStyle whiteBoldFontStyle16 = fontType.copyWith(
    color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
TextStyle whiteFontStyle18 =
    fontType.copyWith(color: Colors.white, fontSize: 18);
TextStyle whiteBoldFontStyle18 = fontType.copyWith(
    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle whiteFontStyle20 =
    fontType.copyWith(color: Colors.white, fontSize: 20);
TextStyle whiteBoldFontStyle20 = fontType.copyWith(
    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
TextStyle whiteFontStyle22 =
    fontType.copyWith(color: Colors.white, fontSize: 22);
TextStyle whiteBoldFontStyle22 = fontType.copyWith(
    color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold);

TextStyle blackFontStyle10 =
    fontType.copyWith(color: Colors.black, fontSize: 10);
TextStyle blackBoldFontStyle10 = fontType.copyWith(
    color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold);
TextStyle blackFontStyle11 =
    fontType.copyWith(color: Colors.black, fontSize: 11);
TextStyle blackBoldFontStyle11 = fontType.copyWith(
    color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold);
TextStyle blackFontStyle12 =
    fontType.copyWith(color: Colors.black, fontSize: 12);
TextStyle blackBoldFontStyle12 = fontType.copyWith(
    color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold);
TextStyle blackFontStyle14 =
    fontType.copyWith(color: Colors.black, fontSize: 14);
TextStyle blackBoldFontStyle14 = fontType.copyWith(
    color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);
TextStyle blackFontStyle16 =
    fontType.copyWith(color: Colors.black, fontSize: 16);
TextStyle blackBoldFontStyle16 = fontType.copyWith(
    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
TextStyle blackFontStyle18 =
    fontType.copyWith(color: Colors.black, fontSize: 18);
TextStyle blackBoldFontStyle18 = fontType.copyWith(
    color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle blackFontStyle20 =
    fontType.copyWith(color: Colors.black, fontSize: 20);
TextStyle blackBoldFontStyle20 = fontType.copyWith(
    color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
TextStyle blackFontStyle22 =
    fontType.copyWith(color: Colors.black, fontSize: 22);
TextStyle blackBoldFontStyle22 = fontType.copyWith(
    color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold);
TextStyle blackFontStyle24 =
    fontType.copyWith(color: Colors.black, fontSize: 24);
TextStyle blackBoldFontStyle24 = fontType.copyWith(
    color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
TextStyle blackFontStyle26 =
    fontType.copyWith(color: Colors.black, fontSize: 26);
TextStyle blackBoldFontStyle26 = fontType.copyWith(
    color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold);
TextStyle blackFontStyle28 =
    fontType.copyWith(color: Colors.black, fontSize: 28);
TextStyle blackBoldFontStyle28 = fontType.copyWith(
    color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold);
TextStyle blackFontStyle30 =
    fontType.copyWith(color: Colors.black, fontSize: 30);
TextStyle blackBoldFontStyle30 = fontType.copyWith(
    color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold);

TextStyle errorStyle = fontType.copyWith(
    color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400);
TextStyle redBoldFontStyle8 = fontType.copyWith(
    color: Colors.red, fontSize: 8, fontWeight: FontWeight.bold);
TextStyle redBoldFontStyle10 = fontType.copyWith(
    color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold);
TextStyle redBoldFontStyle11 = fontType.copyWith(
    color: Colors.red, fontSize: 11, fontWeight: FontWeight.bold);
TextStyle redBoldFontStyle35 = fontType.copyWith(
    color: Colors.red, fontSize: 35, fontWeight: FontWeight.bold);
TextStyle redBoldFont900Style11 = fontType.copyWith(
    color: Colors.red[900], fontSize: 11, fontWeight: FontWeight.bold);
TextStyle redBoldFontStyle12 = fontType.copyWith(
    color: Colors.red[900], fontSize: 12, fontWeight: FontWeight.bold);

TextStyle greenFontStyle10 =
    fontType.copyWith(color: Colors.green, fontSize: 10);
TextStyle greenBoldFontStyle10 = fontType.copyWith(
    color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold);
TextStyle greenBoldStyle12 =
    fontType.copyWith(color: Colors.green[800], fontSize: 12);
TextStyle greenBoldFontStyle12 = fontType.copyWith(
    color: Colors.green[800], fontSize: 12, fontWeight: FontWeight.bold);
TextStyle greenBoldFontStyle14 = fontType.copyWith(
    color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold);
TextStyle greenBoldStyle14 =
    fontType.copyWith(color: Colors.green[800], fontSize: 14);
TextStyle greenBoldFontStyle30 = fontType.copyWith(
    color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold);
TextStyle greenBoldFontStyle35 = fontType.copyWith(
    color: Colors.green, fontSize: 35, fontWeight: FontWeight.bold);

TextStyle orangeFontStyle12 = fontType.copyWith(color: mainColor, fontSize: 12);
TextStyle orangeBoldFontStyle12 = fontType.copyWith(
    color: mainColor, fontSize: 12, fontWeight: FontWeight.bold);
TextStyle orangeBoldFontStyle14 = fontType.copyWith(
    color: mainColor, fontSize: 14, fontWeight: FontWeight.bold);

TextStyle blueFontStyle12 =
    fontType.copyWith(color: Colors.blue[700], fontSize: 12);
TextStyle blueUnderlineFontStyle12 = fontType.copyWith(
    color: Colors.blue[700],
    fontSize: 12,
    decoration: TextDecoration.underline);
TextStyle blueUnderlineBoldFontStyle12 = fontType.copyWith(
    color: Colors.blue[700],
    fontSize: 12,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold);
TextStyle blueBoldFontStyle12 = fontType.copyWith(
    color: Colors.blue[700], fontSize: 12, fontWeight: FontWeight.bold);
TextStyle blueStandartBoldFontStyle12 = fontType.copyWith(
    color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold);
TextStyle blueBoldFontStyle16 = fontType.copyWith(
    color: Colors.blue[700], fontSize: 16, fontWeight: FontWeight.bold);

const double defaultMargin = 24;
