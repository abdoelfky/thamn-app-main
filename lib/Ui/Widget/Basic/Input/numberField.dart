part of widget;

class NumberFieldX extends StatefulWidget {
  final EdgeInsets margin;
  final double min;
  final double max;
  final double step;
  final double value;
  final int decimals;
  final Function(double) onChanged;
  const NumberFieldX({super.key,
    this.margin = const EdgeInsets.symmetric(vertical: 5),
    required this.onChanged,
    this.min=0,
    this.max=100,
    this.step=1,
    this.decimals=0,
    required this.value,
  });

  @override
  State<NumberFieldX> createState() => _NumberFieldXState();
}

class _NumberFieldXState extends State<NumberFieldX> {
  late double value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      margin: widget.margin,
      padding: const EdgeInsets.all(8),
      child: SpinBox(
        min: widget.min,
        max: widget.max,
        value: value,
        step: widget.step,
          decimals:widget.decimals,
        onChanged: (val) {
          setState(() {
            value=val;
          });
          widget.onChanged(val);
        },
        decoration: InputDecoration(
          helperStyle:  TextStyleX.supTitleMedium,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
