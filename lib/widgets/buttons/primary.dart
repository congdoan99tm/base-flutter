import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    super.key,
    this.onPressed,
    this.width = double.maxFinite,
    this.height,
    this.style,
    this.bgColor = Colors.blue,
    this.enable = true,
    this.loading = false,
  });
  final String text;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final TextStyle? style;
  final Color bgColor;
  final bool enable;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 44.h,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              backgroundColor:
                  bgColor.withOpacity((loading || !enable) ? 0.6 : 1),
              side: BorderSide.none),
          onPressed: (enable && !loading) ? onPressed : null,
          child: Center(
            child: loading
                ? LoadingAnimationWidget.prograssiveDots(
                    color: Colors.white,
                    size: 40,
                  )
                : Text(
                    text,
                    style: style ??
                        TextStyle(
                          color: Colors.white,
                          fontSize: 14.w,
                        ),
                  ),
          )),
    );
  }
}
