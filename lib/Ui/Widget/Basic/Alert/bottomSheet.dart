part of widget;

bottomSheetX({required Widget child, String? title,EdgeInsets? padding})=>
    Get.bottomSheet(
      Padding(padding: padding??const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 16),
            child: Center(child: Container(height: 3,width: 60,decoration: BoxDecoration(color: ColorX.greyDark.shade200,borderRadius: BorderRadius.circular(20)),)),
          ),
          if(title!=null)
          TextX(title,style: TextStyleX.titleLarge,),
          if(title!=null)
          const SizedBox(height: 20,),
          child,
          const SizedBox(height: 30,)
        ],
      ),),
      backgroundColor: Get.theme.scaffoldBackgroundColor,isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0),
        ),
      ),
    );