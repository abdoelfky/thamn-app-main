part of widget;

class AppBarRootX extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget title;
  final List<Widget> actions;
  const AppBarRootX({
    super.key,
    required this.title,
    this.height = kToolbarHeight,
    this.actions=const [SizedBox()],
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: title,
        actions: actions,
        centerTitle: false,
      scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Iconsax.menu_1,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      );
  }
}
