part of widget;

class NumberDoubleText extends StatelessWidget {
  const NumberDoubleText(
    this.num, {
    Key? key,
        this.firstText='',
        this.lastText='',
        this.color,
        this.style,
        this.styleDecimalNumber,
  }) : super(key: key);
  final double num;
  final String firstText;
  final String lastText;
  final TextStyle? style;
  final TextStyle? styleDecimalNumber;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextX(
          firstText,
          style: style,
          color: color,
        ),
        Directionality(
          textDirection: TextDirection.ltr,
         child: Row(children: [ TextX(
           num.toInt().toString(),
           style: style,
           color: color,
         ),
           if (num % 1 != 0)
             Padding(
               padding: const EdgeInsets.only(top:3),
               child: TextX(
                 (num % 1).toStringAsFixed(2).substring(1),
                 style: styleDecimalNumber??TextStyleX.titleVerySmall,
                 color: color,
               ),
             ),],),
       ),
        TextX(
          lastText,
          style: style,
          color: color,
        ),
      ],
    );
  }
}
