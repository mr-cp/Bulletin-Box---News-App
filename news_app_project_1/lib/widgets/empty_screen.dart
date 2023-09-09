import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyScreenWidget extends StatelessWidget {
  const EmptyScreenWidget(
      {super.key, required this.text, required this.imagePath});

  final String text;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(imagePath),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              
              style: GoogleFonts.dancingScript(
                textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
