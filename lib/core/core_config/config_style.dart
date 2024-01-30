import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigStyle {
  static regularStyleOne(double? size, Color? color) {
    return GoogleFonts.abel(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: size,
    );
  }

  static regularStyleTwo(double? size, Color? color) {
    return GoogleFonts.aBeeZee(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: size,
    );
  }

  static regularStyleTwoWithUnderLine(double? size, Color? color) {
    return GoogleFonts.aBeeZee(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: size,
      decoration: TextDecoration.underline
    );
  }

  static regularStyleThree(double? size, Color? color) {
    return GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: size,
    );
  }

  static boldStyleOne(double? size, Color? color) {
    return GoogleFonts.abel(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: size,
    );
  }

  static boldStyleTwo(double? size, Color? color) {
    return GoogleFonts.abel(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: size,
    );
  }

  static boldStyleThree(double? size, Color? color) {
    return GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: size,
    );
  }
}
