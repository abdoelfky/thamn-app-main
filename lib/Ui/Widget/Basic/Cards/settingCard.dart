part of widget;

class SettingCardX extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  final bool isDanger;
  final Widget? child;

  const SettingCardX({
    required this.title,
    required this.icon,
    this.onTap,
    this.child,
    this.isDanger = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp, vertical: 20.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorX.grey,
              width: 0.1,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(right: DeviseX.isLTR? 15.0:0.0,left: DeviseX.isLTR? 0:19),
              decoration:  BoxDecoration(
                color: isDanger ? ColorX.danger : ColorX.primary,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Center(child: Icon(
                icon,
                color: Colors.white,
              ),),
            ),
            Expanded(
              child: TextX(
                title,
                color: isDanger ? ColorX.danger : null,
              ),
            ),
            child!=null?child!:
            Container(
                margin: EdgeInsets.only(left:DeviseX.isLTR? 24:0,right:DeviseX.isLTR? 0:24),
                child: Icon(
                  DeviseX.isLTR? Iconsax.arrow_right_3:Iconsax.arrow_left_2,
                  color: isDanger ? ColorX.danger : null,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
