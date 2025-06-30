import 'package:flutter/material.dart';

class BlurredListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsets? contentPadding;

  const BlurredListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
      contentPadding:
          contentPadding ??
          const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
