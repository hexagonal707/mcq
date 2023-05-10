import 'package:flutter/material.dart';

Widget showOptions(BuildContext context, int index, String text, Color? color,
    void Function(int) onTap) {
  return Theme(
    data: ThemeData(
        fontFamily: 'Inter',
        useMaterial3: true,
        brightness: MediaQuery.of(context).platformBrightness,
        colorSchemeSeed: color),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Card(
        elevation: 4,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            onTap(index);
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 60.0, vertical: 14.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  text,
                  textAlign: TextAlign.center,
                  maxLines: 6,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w700),
                )),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
