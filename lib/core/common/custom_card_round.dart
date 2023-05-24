import 'package:flutter/material.dart';

class CustomRoundCard extends StatelessWidget {
  const CustomRoundCard(
      {Key? key,
      this.borderRadius = 15.0,
      required this.child,
      this.onTap,
      this.padding,
      this.backgroundColor,
      this.margin,
      this.borderWidth,
      this.elevation = 0})
      : super(key: key);

  final Widget child;
  final double borderRadius;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double elevation;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderWidth == null
            ? null
            : Border.all(width: borderWidth ?? 0, color: Colors.grey),
        color: backgroundColor ?? Colors.white,
        boxShadow: [
          if (elevation != 0)
            BoxShadow(
              color: Colors.grey,
              offset: Offset(elevation / 10, elevation / 10), //(x,y)
              blurRadius: 0.0,
            ),
        ],
      ),
      // width: double.infinity,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: child),
        ),
      ),
    );
  }
}
