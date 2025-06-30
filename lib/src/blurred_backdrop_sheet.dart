import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlurredBackdropSheet extends StatefulWidget {
  /// The child widget to display in the bottom sheet
  final Widget child;

  /// The blur intensity (0.0 to 30.0)
  final double blurIntensity;

  /// Custom background color overlay
  final Color? backgroundColor;

  /// Border radius for the bottom sheet
  final BorderRadius? borderRadius;

  /// Whether the sheet can be dismissed by dragging
  final bool isDismissible;

  /// Whether to show a drag handle
  final bool showDragHandle;

  /// Animation duration
  final Duration animationDuration;

  /// Minimum height of the bottom sheet
  final double? minHeight;

  /// Maximum height of the bottom sheet
  final double? maxHeight;

  /// Initial height of the bottom sheet
  final double? initialHeight;

  /// Callback when sheet is dismissed
  final VoidCallback? onDismissed;

  const BlurredBackdropSheet({
    super.key,
    required this.child,
    this.blurIntensity = 15.0,
    this.backgroundColor,
    this.borderRadius,
    this.isDismissible = true,
    this.showDragHandle = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.minHeight,
    this.maxHeight,
    this.initialHeight,
    this.onDismissed,
  });

  @override
  State<BlurredBackdropSheet> createState() => _BlurredBackdropSheetState();
}

class _BlurredBackdropSheetState extends State<BlurredBackdropSheet>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _blurAnimation = Tween<double>(
      begin: 0.0,
      end: widget.blurIntensity,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _dismiss() {
    if (!widget.isDismissible) return;

    HapticFeedback.lightImpact();
    _controller.reverse().then((_) {
      if (mounted) {
        Navigator.of(context).pop();
        widget.onDismissed?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            // Blurred backdrop
            Positioned.fill(
              child: GestureDetector(
                onTap: _dismiss,
                child: AnimatedBuilder(
                  animation: _blurAnimation,
                  builder: (context, child) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: _blurAnimation.value,
                        sigmaY: _blurAnimation.value,
                      ),
                      child: Container(
                        color:
                            widget.backgroundColor ??
                            (isDark
                                ? Colors.black.withOpacity(
                                  0.3 * _animation.value,
                                )
                                : Colors.white.withOpacity(
                                  0.2 * _animation.value,
                                )),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Bottom sheet content
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Transform.translate(
                offset: Offset(0, (1 - _animation.value) * 300),
                child: _BlurredSheetContent(
                  child: widget.child,
                  borderRadius: widget.borderRadius,
                  showDragHandle: widget.showDragHandle,
                  isDismissible: widget.isDismissible,
                  minHeight: widget.minHeight,
                  maxHeight: widget.maxHeight ?? mediaQuery.size.height * 0.9,
                  initialHeight: widget.initialHeight,
                  onDismiss: _dismiss,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BlurredSheetContent extends StatefulWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final bool showDragHandle;
  final bool isDismissible;
  final double? minHeight;
  final double maxHeight;
  final double? initialHeight;
  final VoidCallback onDismiss;

  const _BlurredSheetContent({
    required this.child,
    required this.borderRadius,
    required this.showDragHandle,
    required this.isDismissible,
    required this.minHeight,
    required this.maxHeight,
    required this.initialHeight,
    required this.onDismiss,
  });

  @override
  State<_BlurredSheetContent> createState() => _BlurredSheetContentState();
}

class _BlurredSheetContentState extends State<_BlurredSheetContent> {
  double _dragOffset = 0.0;
  bool _isDragging = false;

  void _handleDragStart(DragStartDetails details) {
    if (!widget.isDismissible) return;
    _isDragging = true;
    HapticFeedback.selectionClick();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (!widget.isDismissible) return;
    setState(() {
      _dragOffset += details.delta.dy;
      _dragOffset = _dragOffset.clamp(0.0, 300.0);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    if (!widget.isDismissible) return;
    _isDragging = false;

    if (_dragOffset > 100 || details.velocity.pixelsPerSecond.dy > 500) {
      widget.onDismiss();
    } else {
      setState(() {
        _dragOffset = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AnimatedContainer(
      duration: _isDragging ? Duration.zero : const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      transform: Matrix4.translationValues(0, _dragOffset, 0),
      child: ClipRRect(
        borderRadius:
            widget.borderRadius ??
            const BorderRadius.vertical(top: Radius.circular(28)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            constraints: BoxConstraints(
              minHeight: widget.minHeight ?? 200,
              maxHeight: widget.maxHeight,
            ),
            decoration: BoxDecoration(
              color:
                  isDark
                      ? Colors.grey[900]?.withOpacity(0.85)
                      : Colors.white.withOpacity(0.85),
              borderRadius:
                  widget.borderRadius ??
                  const BorderRadius.vertical(top: Radius.circular(28)),
              border: Border.all(
                color:
                    isDark
                        ? Colors.white.withOpacity(0.1)
                        : Colors.black.withOpacity(0.1),
                width: 0.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.showDragHandle)
                  GestureDetector(
                    onPanStart: _handleDragStart,
                    onPanUpdate: _handleDragUpdate,
                    onPanEnd: _handleDragEnd,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Container(
                          width: 36,
                          height: 4,
                          decoration: BoxDecoration(
                            color: theme.dividerColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ),
                Flexible(child: widget.child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
