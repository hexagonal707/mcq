import 'package:flutter/material.dart';

class CustomModalBottomSheetListItem extends StatelessWidget {
  final String? text;
  final Widget icon;
  final bool arrow;
  final void Function()? onTap;

  const CustomModalBottomSheetListItem({
    Key? key,
    this.text,
    required this.icon,
    required this.arrow,
    this.onTap,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                const SizedBox(width: 20.0),
                icon,
                const SizedBox(
                  width: 15.0,
                ),
                Text('$text'),
              ],
            ),
            const SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: arrow
                    ? const <Widget>[
                        Icon(Icons.arrow_forward_ios_sharp, size: 20.0),
                      ]
                    : [],
              ),
            ),
          ],
        ),
      );
}
