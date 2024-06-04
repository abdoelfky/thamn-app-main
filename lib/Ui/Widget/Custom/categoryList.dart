part of widget;

class CategoriesListX extends StatelessWidget {
  final List<CategoryX> categories;
  final int selected;
  final Function(int) onSelected;
  const CategoriesListX(
      {required this.categories,
      required this.onSelected,
      required this.selected,
      Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsetsDirectional.only(start: StyleX.hPaddingApp),
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        for(int index=0;index<categories.length;index++)
        Padding(
          padding: EdgeInsetsDirectional.only(end: index!=categories.length-1?20.0:0),
          child: GestureDetector(
            onTap: () {
              onSelected(categories[index].id);
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: selected == categories[index].id ? ColorX.primary : ColorX.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ImageNetworkX(imageUrl:categories[index].icon,color: selected == categories[index].id ? Colors.white : ColorX.greyDark,),
                  ),
                ),
                const SizedBox(height: 10,),
                TextX(categories[index].name,style: TextStyleX.titleSmall,color: selected == categories[index].id ? ColorX.primary : ColorX.greyDark,),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
