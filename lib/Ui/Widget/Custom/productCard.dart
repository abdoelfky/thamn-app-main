part of widget;

class ProductCardX extends StatelessWidget {
  const ProductCardX(this.product, {super.key});
  final ProductX product;
  @override
  Widget build(BuildContext context) {
    RootController rootController = Get.find<RootController>();

    return Stack(
      children: [
        GestureDetector(
          onTap: () => rootController.changePage(4 , productID:  product.id),
          // onTap: () => Get.toNamed(RouteNameX.productDetails,
          //     arguments: product.id, preventDuplicates: false),
          child: ContainerCardX(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: ColorX.warning.withOpacity(0.9)),
                  padding: const EdgeInsets.all(4),
                  child: NumberDoubleText(product.discount,firstText: '%',
                      style: TextStyleX.supTitleMedium, color: ColorX.danger),
                ),
                const SizedBox(
                  height: 6,
                ),
                Expanded(
                    child: SizedBox(
                        width: double.infinity,
                        child: ImageNetworkX(
                          imageUrl: product.image,
                          fit: BoxFit.contain,
                        ))),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        NumberDoubleText(product.currentPrice,
                            color: ColorX.primary,
                            style: TextStyleX.titleSmall),
                        TextX(
                          ' ${product.currency.tr}',
                          color: ColorX.primary,
                          style: TextStyleX.titleSmall,
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            NumberDoubleText(
                              product.previousPrice,
                              color: ColorX.greyDark,
                              style: TextStyleX.titleSmall,
                            ),
                            TextX(
                              ' ${product.currency.tr}',
                              color: ColorX.greyDark,
                              style: TextStyleX.titleSmall
                            ),
                          ],
                        ),
                        Container(color: ColorX.greyDark,height: 1,width: 45,)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned.directional(
          textDirection: Directionality.of(context),
          start: 0,
          child: GestureDetector(
            onTap: () =>
                Get.toNamed(RouteNameX.storeDetails, arguments: product),
            child: ContainerCardX(
              height: 30,
              width: 30,
              radius: 50,
              child: ImageNetworkX(
                  imageUrl: product.store?.logo ?? '', fit: BoxFit.contain),
            ),
          ),
        )
      ],
    );
  }
}
