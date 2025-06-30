import 'package:blurred_backdrop_sheet/src/blurred_backdrop_sheet.dart';
import 'package:flutter/material.dart';

class BlurredBackdropSheetController {
  /// Show a blurred backdrop sheet
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    double blurIntensity = 15.0,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    bool isDismissible = true,
    bool showDragHandle = true,
    Duration animationDuration = const Duration(milliseconds: 300),
    double? minHeight,
    double? maxHeight,
    double? initialHeight,
    VoidCallback? onDismissed,
    bool useRootNavigator = false,
  }) {
    return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(
      PageRouteBuilder<T>(
        opaque: false,
        barrierDismissible: false,
        pageBuilder: (context, animation, secondaryAnimation) {
          return BlurredBackdropSheet(
            blurIntensity: blurIntensity,
            backgroundColor: backgroundColor,
            borderRadius: borderRadius,
            isDismissible: isDismissible,
            showDragHandle: showDragHandle,
            animationDuration: animationDuration,
            minHeight: minHeight,
            maxHeight: maxHeight,
            initialHeight: initialHeight,
            onDismissed: onDismissed,
            child: child,
          );
        },
      ),
    );
  }
}
