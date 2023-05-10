import 'package:flutter/material.dart';

Widget showQuestion(BuildContext context, String text) {
  return Padding(
    padding:
        const EdgeInsets.only(top: 24.0, bottom: 32.0, left: 12.0, right: 12.0),
    child: Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 50.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              text,
              textAlign: TextAlign.center,
              maxLines: 6,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            )),
          ],
        ),
      ),
    ),
  );
}
