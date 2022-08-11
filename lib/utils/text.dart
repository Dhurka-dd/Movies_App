import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifyText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  ModifyText({super.key, this.text, this.color,this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.breeSerif(
        color: color,
        fontSize: size,
      ),
    );
  }
}
