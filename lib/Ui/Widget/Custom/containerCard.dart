part of widget;

class ContainerCardX extends StatelessWidget {
  const ContainerCardX({
    this.margin,
    required this.child,super.key, this.radius, this.width, this.height, this.padding, this.border, this.isShadow=true});

  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget child;
  final double? radius;
  final double? width;
  final double? height;
  final BoxBorder? border;
  final bool isShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          border: border,
          borderRadius:
          BorderRadius.circular(radius??StyleX.radius),
          color: context.isDarkMode?Theme.of(context).cardColor:Colors.white,
          boxShadow: isShadow?[StyleX.shadow]:null,
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(radius??StyleX.radius),child: Padding(
        padding: padding??const EdgeInsets.all(0),
        child: child,
      )),
    );
  }
}
