part of widget;

class ProductSuggestionsCardX extends StatelessWidget {
  const ProductSuggestionsCardX(
      {super.key,
      required this.isShowUnitPrice,
      required this.product,
      required this.changeProduct});

  final ProductX product;
  final bool isShowUnitPrice;
  final Function(int id) changeProduct;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bottomSheetX(
          child: AddToCartSection(product),
        );
      },
      child: ContainerX(
        color: Colors.transparent,
        isBorder: true,
        borderColor: ColorX.greyDark.shade50,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageNetworkX(
              imageUrl: product.image,
              height: 75,
              width: 75,
              fit: BoxFit.cover,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(
                RouteNameX.storeDetails,
                arguments: product.store,
              ),
              child: ContainerCardX(
                height: 38,
                width: 38,
                radius: 38,
                child: ImageNetworkX(
                  imageUrl: product.store?.logo ?? '',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            TextX('${product.quantity} ${product.unit.tr}',
                style: TextStyleX.titleSmall, color: ColorX.greyDark),
            Row(
              children: [
                NumberDoubleText(product.currentPrice,
                    style: TextStyleX.titleSmall, color: ColorX.primary),
                TextX(' ${product.currency.tr}',
                    style: TextStyleX.titleSmall, color: ColorX.primary),
              ],
            ),
            if (isShowUnitPrice)
              SizedBox(
                  height: 75,
                  child: CardProductUnitPriceX(
                      pricePerQuantity: product.pricePerQuantity,
                      currency: product.currency,
                      unit: product.unit)),
            if (!isShowUnitPrice) const SizedBox()
          ],
        ),
      ),
    );
  }
}
