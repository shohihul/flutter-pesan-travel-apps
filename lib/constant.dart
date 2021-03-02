import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String url = 'http://192.168.1.9:8000';
// String url = 'http://pesantravel.9cahayagroup.com/';
String googleAPIKey = 'AIzaSyDUoG8AXM6QMr7vHiA-188imSF-3fBLL4E';

class ColorPalette {
  static Color background = Color(0xffF1F5F6);
  static Color grey = Color(0xFFC4C4C4);
  static Color darkBlue = Color(0xff131D55);
  static Color cyan = Color(0xff0CC4E0);
  static Color blue = Color(0xFF398AE5);
}

const primaryColor = Color(0xFF0CC4E0);
const secondColor = Color(0xFF131D55);
const kTextColor = Color(0xFF3C4046);
const backgroundColor = Color(0xFFF1F5F6);
const greyColor = Color(0xFFB2B2B2);
const dangerColor = Color(0xFFFF6A71);
const warningColor = Color(0xFFFF8329);
const successColor = Color(0xFF107C62);

final gradientPrimaryColor = LinearGradient(
  colors: [primaryColor, Color(0xFF79EDFF)],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);

final gradientSecondColor = LinearGradient(
  colors: [secondColor, Color(0xFF384593)],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);

final gradientWarningColor = LinearGradient(
  colors: [Color(0xFFFF4444), warningColor],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);

const double kDefaultPadding = 20;

var moneyFormat = NumberFormat.compactCurrency(symbol: 'IDR ',);

final defaultBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(0.15),
  offset: Offset(0, 5),
  spreadRadius: -5,
  blurRadius: 10,
);

final primaryTitleTextStyle = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
  fontSize: 14.0
);
final secondTitleTextStyle = TextStyle(
  color: secondColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
  fontSize: 14
);

final smallSecondBoldTextStyle = TextStyle(
  color: secondColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
  fontSize: 12
);

final smallSecondTextStyle = TextStyle(
  color: secondColor,
  fontFamily: 'Montserrat',
  fontSize: 10
);

final smallTitleTextStyle = TextStyle(
  color: greyColor,
  fontFamily: 'Montserrat',
  fontSize: 12,
);

final hintTextStyle = TextStyle(
  color: greyColor,
  fontFamily: 'Montserrat',
);

final divider = Divider(
  height: 30,
  thickness: 1,
  color: Color(0xFFEEEEEE),
);

final labelStyle = TextStyle(
  color: secondColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
  fontSize: 12
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
);

final formTextStyle = TextStyle(
  color: secondColor,
  fontFamily: 'Montserrat'
);

final sizeBoxVertical = SizedBox(height: 20);
final sizeBoxHorizontal = SizedBox(width: 20);
