part of widget;

class LayoutWidgetX extends StatelessWidget {
  final Widget? largeScreen;
  final Widget? mediumScreen;
  final Widget smallScreen;

  const LayoutWidgetX({
    Key? key,
    this.largeScreen,
    this.mediumScreen,
    required this.smallScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        switch (DeviseX.size(context)) {
          case SizeType.small:
            return smallScreen;
          case SizeType.medium:
            return mediumScreen ?? smallScreen;
          case SizeType.large:
            return largeScreen ?? smallScreen;
        }
      },
    );
  }
}

// case SizeType.medium:
// return mediumScreen ?? smallScreen;
// case SizeType.large:
// return largeScreen ?? xLargeScreen?? mediumScreen ?? smallScreen;
// case SizeType.xLarge:
// return xLargeScreen ?? largeScreen?? mediumScreen ??smallScreen;