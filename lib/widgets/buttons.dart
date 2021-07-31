import 'dart:ui';
// import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'focusable_control_builder.dart';

class FocusableButton extends StatelessWidget {
  const FocusableButton(
    this.label, {
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FocusableControlBuilder(
      onPressed: onPressed,
      builder: (_, control) {
        Color basecolor = _color(context, control);
        // Color outlineColor =
        //     control.isFocused ? Colors.black : Colors.transparent;
        // Color bgColor =
        //     control.isHovered ? Colors.blue.shade100 : Colors.grey.shade200;
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text(label),
          decoration: BoxDecoration(
            color: basecolor,
            border: Border.all(color: basecolor, width: 1),
          ),
        );
      },
    );
  }
}

class FocusableIconButton extends StatelessWidget {
  const FocusableIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.color,
  }) : super(key: key);
  final String label;
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FocusableControlBuilder(
      requestFocusOnPress: false,
      onPressed: onPressed,
      builder: (_, control) {
        Color basecolor = _color(context, control);
        // final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
        // final double gap =
        //     scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
        // Color outlineColor =
        //     control.isFocused ? Colors.black : Colors.transparent;
        // Color bgColor =
        //     control.isHovered ? Colors.blue.shade100 : Colors.grey.shade200;

        return Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(label),
              // SizedBox(width: gap),
              Icon(icon, size: 16, color: color),
            ],
          ),
          decoration: BoxDecoration(
            color: basecolor,
            border: Border.all(color: basecolor, width: 1),

            // borderRadius: BorderRadius.circular(2),
          ),
        );
      },
    );
  }
}

Color _color(BuildContext context, FocusableControlState control) {
  Color background = Theme.of(context).backgroundColor;
  Color foreground = Theme.of(context).accentColor;
  print('baseColor: $background');
  if (control.isFocused) {
    // baseColor = Color.alphaBlend(Colors.black.withOpacity(0.25), baseColor);
    background = Color.alphaBlend(
        foreground.withOpacity(0.25), background.withOpacity(0.25));
    print('isfocused: $background');
  }
  if (control.isHovered) {
    // baseColor = Color.alphaBlend(Colors.black.withOpacity(0.1), baseColor);
    background = Color.alphaBlend(
        foreground.withOpacity(0.1), background.withOpacity(0.1));
    print('ishovered: $background');
  }
  return background;
}
