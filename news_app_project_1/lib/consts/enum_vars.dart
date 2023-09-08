// enum for selecting tabs:
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsTabType {
  allNews,
  topTrending,
}

// enum for sorting:
enum SortByEnum {
  relevency,
  popularity,
  publishedAt,
}

// const text styles:
TextStyle smallTextStyle = GoogleFonts.montserrat(fontSize: 15,letterSpacing: 1.2);
