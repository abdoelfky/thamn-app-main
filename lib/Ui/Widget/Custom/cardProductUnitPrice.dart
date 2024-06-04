part of widget;

class CardProductUnitPriceX extends StatelessWidget {
  const CardProductUnitPriceX({
    super.key,
    required this.pricePerQuantity,
    required this.currency,
    required this.unit, this.isBorder,
  });
  final double pricePerQuantity;
  final String currency;
  final String unit;
  final bool? isBorder;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      width: 110,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 6),
      isBorder: isBorder??false,
      color: ColorX.secondary.withOpacity(0.15),
      margin: EdgeInsets.zero,
      child: Center(
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              NumberDoubleText(pricePerQuantity,color:context.isDarkMode ? Colors.white : ColorX.primary,
              style: TextStyleX.titleSmall,
              ),
              TextX(
                ' ${currency.tr} ',
                style: TextStyleX.titleSmall,
                color: context.isDarkMode ? Colors.white : ColorX.primary,
              ),
              TextX(
                '/ 1 ${unit.tr}',
                style: TextStyleX.titleSmall,
                color: context.isDarkMode ? Colors.white : ColorX.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
