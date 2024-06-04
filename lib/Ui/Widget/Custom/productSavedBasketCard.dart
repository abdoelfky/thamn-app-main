part of widget;

class ProductSavedBasketCardX extends StatelessWidget {
  const ProductSavedBasketCardX({required this.productBasket,super.key});
  final ProductBasketX productBasket;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(boxShadow: [StyleX.shadow]),
      child: ContainerCardX(
        isShadow: false,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ImageNetworkX(
                      imageUrl: productBasket.product.image,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                TextX(
                    '${productBasket.product.quantity} ${productBasket.product.unit}',
                    style: TextStyleX.titleSmall,
                    color: ColorX.greyDark),
                Row(
                  children: [
                    NumberDoubleText(productBasket.product.currentPrice,
                      style: TextStyleX.titleSmall,
                      color: ColorX.primary,
                    ),
                    TextX(
                      productBasket.product.currency.tr,
                      style: TextStyleX.titleSmall,
                      color: ColorX.primary,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextX('No. ',
                        style: TextStyleX.titleSmall,
                      color: ColorX.greyDark,
                    ),
                    TextX(productBasket
                        .quantity
                        .toString(),
                        style: TextStyleX.titleSmall,
                    color: ColorX.greyDark,
                    ),
                    const SizedBox(width: 30,)
                  ],
                ),
              ],
            ),
            if (productBasket.note.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0),
                child: Column(
                  children: [
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextX(
                          '${'Note'.tr}: ',
                          color: ColorX.greyDark,
                        ),
                        TextX(
                          productBasket.note,
                          color: ColorX.greyDark,
                        ),
                      ],
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
