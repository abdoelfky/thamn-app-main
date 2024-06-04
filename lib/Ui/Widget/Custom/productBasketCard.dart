part of widget;

class ProductBasketCardX extends StatelessWidget {
  const ProductBasketCardX({required this.productBasket,super.key, required this.onDelete, required this.onChangeDone, required this.onAdd, required this.onMinus});
  final ProductBasketX productBasket;
  final Function(int) onDelete;
  final Function(bool,int) onChangeDone;
  final Function(int) onAdd;
  final Function(int) onMinus;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(boxShadow: [StyleX.shadow]),
      child: Dismissible(
        key: Key(productBasket.productID.toString()),
        confirmDismiss: (DismissDirection direction) async {
          return await AlertDialogX.okAndCancel(
              title: 'Delete item',
              message:
              'Are you sure you want to remove this item?',
              textOK: 'Delete',
              colorTextOk: ColorX.danger,
              onOk: (){
                onDelete(productBasket.id);
              });
        },
        background: Container(
          color: ColorX.danger,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        child: ContainerCardX(
          isShadow: false,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: productBasket.isDone,
                                  onChanged: (val) {
                                    onChangeDone(val ?? false,
                                        productBasket.id);
                                  },
                                ),
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
                            NumberDoubleText(productBasket.product.currentPrice,
                              style: TextStyleX.titleSmall,
                              color: ColorX.primary,
                              lastText: ' ${productBasket.product.currency.tr}',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: ()async{
                              await onMinus(productBasket.id);
                            },
                            child: ContainerX(
                                padding: const EdgeInsets.all(4),
                                child: Icon(
                                  Iconsax.minus,
                                  color: ColorX.greyDark,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0),
                            child: TextX(productBasket
                                    .quantity
                                    .toString(),
                                style: TextStyleX.titleSmall),
                          ),
                          GestureDetector(
                            onTap: ()async{
                              await onAdd(productBasket.id);
                            },
                            child: ContainerX(
                                padding: const EdgeInsets.all(4),
                                child: Icon(
                                  Iconsax.add,
                                  color: ColorX.greyDark,
                                ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (productBasket.isDone)
                    Divider(
                      thickness: 6,
                      color: ColorX.greyDark.withOpacity(0.45),
                      indent: 45.0,
                      endIndent: 20.0,
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
      ),
    );
  }
}
