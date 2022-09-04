import 'package:flutter/material.dart';

class BriefDescription extends StatefulWidget {
  final String description;

  const BriefDescription({Key? key, required this.description}) : super(key: key);

  @override
  State<BriefDescription> createState() => _BriefDescriptionState();
}

class _BriefDescriptionState extends State<BriefDescription> {
  bool _openCompleteDescriptions = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: _openCompleteDescriptions ? 170 : 100,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _openCompleteDescriptions = !_openCompleteDescriptions;
            });
          },
          child: Text(
            widget.description,
            maxLines: _openCompleteDescriptions ? 8 : 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
            ),
          ),
        ));
  }
}