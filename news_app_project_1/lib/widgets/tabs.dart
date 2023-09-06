import 'package:flutter/material.dart';

class GenreSelector extends StatelessWidget {
  const GenreSelector({
    super.key,
    required this.title,
    required this.func,
    required this.color,
    required this.fontsize,
  });
  final String title;
  final Function func;
  final Color color;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func() ,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: color),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: fontsize),
          ),
        ),
      ),
    );
  }
}
