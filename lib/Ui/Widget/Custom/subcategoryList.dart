part of widget;

class SubcategoryListX extends StatelessWidget {
  late final List<SubcategoryX> subcategories;
  final int selected;
  final Function(int) onSelected;
  SubcategoryListX(
      {required List<SubcategoryX> subcategories,
      required this.onSelected,
      required this.selected,
      Key? key})
      : super(key: key){
    this.subcategories=[SubcategoryX(id: 0, name: 'all'.tr),...subcategories];
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),
      child: Row(
       children: [
         for(int index=0;index<subcategories.length;index++)
           GestureDetector(
           onTap: () {
             onSelected(subcategories[index].id);
           },
           child: Container(
             alignment: Alignment.center,
             padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 7),
             margin: EdgeInsetsDirectional.only(end: index!=subcategories.length-1?10.0:0),
             decoration: BoxDecoration(
               color: selected == subcategories[index].id ? ColorX.primary : ColorX.grey,
               borderRadius: BorderRadius.circular(50),
             ),
             child: TextX(
               subcategories[index].name,
               color: selected == subcategories[index].id
                   ? Colors.white
                   : ColorX.greyDark,
               style: TextStyleX.supTitleLarge,
             ),
           ),
         )
       ],
      ),
    );
  }
}
