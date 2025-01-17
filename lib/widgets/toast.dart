import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class ToastWidget extends StatelessWidget {
  const ToastWidget({
    super.key,
    this.text = '',
    this.iconData = Icons.warning,
    this.bgColor = Colors.redAccent,
    this.isMultiLine = false,
  });
  final String text;
  final IconData iconData;
  final Color bgColor;
  final bool isMultiLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: bgColor,
      ),
      child: isMultiLine
          ? Text(
              text,
              textAlign: TextAlign.center
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  iconData,
                  color: Colors.white,
                ),
                const Gap(12.0),
                Text(
                  text
                ),
              ],
            ),
    );
  }
}

class ToastWidgetMultiLine extends StatelessWidget {
  const ToastWidgetMultiLine({
    super.key,
    this.text = '',
    this.iconData = Icons.warning,
    this.bgColor = Colors.redAccent,
  });
  final String text;
  final IconData iconData;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: bgColor,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center
      ),
    );
  }
}
