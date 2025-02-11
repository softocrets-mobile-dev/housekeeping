import 'package:flutter/material.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';

class StateLoaderView extends StatelessWidget {
  const StateLoaderView({
    super.key,
    this.isLoading = false,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IgnorePointer(ignoring: isLoading, child: child),
        if (isLoading)
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: Card(
              child: Center(
                child: RepaintBoundary(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
