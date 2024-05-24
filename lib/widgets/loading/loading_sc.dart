import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingFullScreen extends StatelessWidget {
  const LoadingFullScreen({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: 133,
          height: 133,
          padding: const EdgeInsets.all(21),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14), color: Colors.black),
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: color == null ? Colors.white : Colors.black,
            size: 92,
          ),
        ),
      ),
    );
  }
}
