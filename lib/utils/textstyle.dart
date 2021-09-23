import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voltro_task/utils/colors.dart';

class AppTextStyle {
  static final TextStyle appbarTitle = GoogleFonts.roboto(
    color: blackColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle regular14black = GoogleFonts.roboto(
    color: blackColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle regular24white = GoogleFonts.roboto(
    color: whiteColor,
    fontSize: 24,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle medium10white = GoogleFonts.roboto(
    color: whiteColor,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle medium10grey = GoogleFonts.roboto(
    color: grey,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle regular16grey = GoogleFonts.roboto(
    color: grey,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}
