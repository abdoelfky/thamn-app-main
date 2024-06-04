part of widget;

class ButtonX extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final double marginHorizontal;
  final double marginVertical;
  final double? width;
  final Function onTap;
  final bool halfWidth;
  final bool disabled;
  late final Color? colorButton;
  late final Color borderColor;
  late final Color? colorText;
  ButtonX(
      {required this.onTap,
        required this.text,
        colorButton,
        this.disabled = false,
        this.iconData,
        this.width,
        this.marginVertical = 5,
        this.halfWidth = false,
        this.borderColor=Colors.transparent,
        this.marginHorizontal = 0,
        this.colorText = Colors.white,
        Key? key})
      : super(key: key) {
    this.colorButton = colorButton ?? ColorX.primary;
  }
  ButtonX.second(
      {required this.onTap,
        required this.text,
        this.colorButton = Colors.white,
        this.disabled = false,
        this.iconData,
        this.width,
        this.marginVertical = 5,
        this.halfWidth = false,
        this.borderColor=Colors.transparent,
        this.marginHorizontal = 0,
        this.colorText = Colors.black,
        Key? key})
      : super(key: key);

  ButtonX.dangerous(
      {required this.onTap,
        this.disabled = false,
        required this.text,
        this.iconData,
        this.width,
        this.borderColor=Colors.transparent,
        this.colorButton = Colors.white,
        this.halfWidth = false,
        this.marginVertical = 5,
        this.marginHorizontal = 0,
        Key? key})
      : super(key: key) {
    colorText = ColorX.danger;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled) {
          onTap();
        }
      },
      child: Container(
        height: 50,
        width: width??double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: marginVertical,
          horizontal: marginHorizontal,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(StyleX.radius),
          color: disabled ? ColorX.grey : colorButton,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconData != null
                ? Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(iconData, color: colorText),
            )
                : const SizedBox(),
            TextX(text,color: colorText,style: TextStyleX.titleSmall),
          ],
        ),
      ),
    );
  }
}
