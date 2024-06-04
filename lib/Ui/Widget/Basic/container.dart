part of widget;

class ContainerX extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double maxWidth;
  final double minWidth;
  final double? radius;
  final Color? color;
  final Color? borderColor;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final bool isBorder;
  const ContainerX(
      {this.width,
      this.maxWidth = double.infinity,
      this.minWidth = 0.0,
      this.isBorder = false,
      this.height,
        this.color,
        this.borderColor,
        this.radius,
      this.padding,
      this.margin = const EdgeInsets.symmetric(vertical: 6),
      required this.child,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth, minWidth: minWidth),
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius??StyleX.radius),
        border: isBorder
            ? Border.all(width: 1, color: borderColor??ColorX.greyDark)
            : null,
        color: color ?? Theme.of(context).cardColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(StyleX.radius),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10),
          child: child,
        ),
      ),
    );
  }
}
