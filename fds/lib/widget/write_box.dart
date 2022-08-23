import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding write_box(Size size, TextEditingController? _controller, String hint,
    Widget? label, String txt1) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt1,
          style: GoogleFonts.acme(
              color: Color.fromARGB(255, 25, 173, 161),
              fontSize: 27,
              fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: size.width,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: Color.fromARGB(255, 212, 228, 226),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              readOnly: label == null ? false : true,
              controller: _controller,
              decoration: InputDecoration(
                label: label,
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
