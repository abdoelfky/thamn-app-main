part of widget;

class AppBarX extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String? title;
  final List<Widget>? actions;
  final bool isBack;
  final Color? color;
  final Color? backgroundColor;

  AppBarX({
    this.title,
    this.height = kToolbarHeight,
    this.actions,
    this.isBack = true,
    this.color,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    RootController rootController = Get.find<RootController>();

    return AppBar(
      title: title != null
          ? TextX(
              title!,
              style: TextStyleX.titleLarge,
            )
          : null,
      actions: actions,
      backgroundColor: backgroundColor,
      leading: isBack
          ? IconButton(
              onPressed: ()  {rootController.onWillPop(); Get.back();},
              icon: Icon(
                DeviseX.isLTR ? Iconsax.arrow_left_2 : Iconsax.arrow_right_3,
                color: color,
              ),
            )
          : const SizedBox(),
      elevation: 0,
    );
  }
}
