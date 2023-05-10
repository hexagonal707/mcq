import 'package:flutter/material.dart';

import '../models/question_model.dart';

class OptionTile extends StatefulWidget {
  final String text;
  final int index;
  final Question question;
  final Function(int) onTap;
  final Color? color;

  OptionTile({
    required this.text,
    required this.index,
    required this.question,
    required this.onTap,
    required this.color,
  });

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    Color? backc = Theme.of(context).cardColor;
    return InkWell(
      onTap: () {
        widget.onTap(widget.index);
        setState(() {
          if (widget.index != widget.question.answer) {
            setState(() {
              backc = Colors.red;
            });
          } else {
            setState(() {
              backc = Colors.green;
            });
          }
        });
      },
      child: Card(
        color: backc,
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
