import 'package:flutter/material.dart';

class BlurredSheetHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget>? actions;

  const BlurredSheetHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
      child: Row(
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 16)],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodyMedium?.color?.withOpacity(
                        0.7,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}
