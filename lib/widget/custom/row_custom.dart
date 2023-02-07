import 'package:edugame/utility/warna.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowCustom extends StatefulWidget {
  final String judul;
  final String output;
  final Color color;

  const RowCustom({Key? key, required this.judul, required this.output, required this.color})
      : super(key: key);

  @override
  State<RowCustom> createState() => _RowCustomState();
}

class _RowCustomState extends State<RowCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              widget.judul,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: widget.color,
              ),
            ),
          ),
          Text(
            ':',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: widget.color,
            ),
          ),
          SizedBox(width: 7),
          Expanded(
            child: Text(
              widget.output,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: widget.color,
              ),
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
