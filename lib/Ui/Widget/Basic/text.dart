part of widget;

class TextX extends StatelessWidget {
  const TextX(
    this.data, {
    Key? key,
    this.style, this.color, this.textAlign, this.overflow= TextOverflow.visible, this.maxLines,
  }) : super(key: key);
  final String data;
  final TextStyle? style;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      data.tr,maxLines: maxLines,
      style: style?.copyWith(color: color) ?? TextStyleX.titleMedium.copyWith(color: color,overflow: overflow),
      textAlign: textAlign,
    );
  }
}
