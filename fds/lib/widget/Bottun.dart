import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/start_page.dart';

Container bottun(
  Size size,
  String txt,
) {
  return Container(
      height: 60,
      width: size.width * 0.60,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 122, 196, 189),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text(
          txt,
          style: GoogleFonts.acme(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ));
}
