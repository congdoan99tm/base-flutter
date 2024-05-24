import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TransButton extends StatelessWidget {
  const TransButton({
    required this.text,
    super.key,
    this.onPressed,
    this.width = double.maxFinite,
    this.height = 44,
    this.style,
    this.colorSide = Colors.blue,
    this.isLoading = false,
  });
  final String text;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final TextStyle? style;
  final Color colorSide;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            backgroundColor: Colors.transparent,
            side: BorderSide(color: colorSide)),
        onPressed: onPressed,
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: isLoading
                ? LoadingAnimationWidget.waveDots(
                    color: colorSide,
                    size: 40,
                  )
                : Text(
                    text,
                    style: style ??
                        TextStyle(
                          fontSize: 14.w,
                          color: colorSide,
                        ),
                  ),
          ),
        ));
  }
}
