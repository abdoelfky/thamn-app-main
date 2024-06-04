part of widget;

class BasketStoreBarX extends StatelessWidget {
  const BasketStoreBarX({required this.store,required this.totalPrice,super.key, required this.currency});
  final StoreX store;
  final double totalPrice;
  final String currency;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(RouteNameX.storeDetails,
              arguments: store),
          child: Row(
            children: [
              ContainerCardX(
                height: 40,
                width: 40,
                radius: 40,
                child: ImageNetworkX(
                  imageUrl: store.logo,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TextX(
                store.name,
                style: TextStyleX.titleSmall,
              )
            ],
          ),
        ),
        NumberDoubleText(totalPrice,lastText: ' ${currency.tr}',
          style: TextStyleX.titleSmall,
          color: ColorX.primary,
        )
      ],
    );
  }
}
