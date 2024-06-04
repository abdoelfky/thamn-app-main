part of widget;

class DropdownX extends StatefulWidget {
  const DropdownX({Key? key, required this.title,required this.value, required this.list, required this.onChanged, required this.icon}) : super(key: key);
  final String title;
  final dynamic value;
  final List list;
  final IconData icon;
  final Function(dynamic) onChanged;

  @override
  State<DropdownX> createState() => _DropdownXState();
}

class _DropdownXState extends State<DropdownX> {
  dynamic value;
  @override
  void initState() {
    value = widget.value;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 25),
      child: Row(
        children: [
          Icon(widget.icon,size: 22,),
          const SizedBox(width: 10.0,),
          TextX('${widget.title.tr}:',style: TextStyleX.supTitleMedium),
          const SizedBox(width: 10.0,),
          Expanded(
            child: DropdownButton(
              isExpanded: true,
              icon: const Icon(Iconsax.arrow_down_1,size: 22),
              value: value,
              alignment: AlignmentDirectional.center,
              underline: const SizedBox(),
              items: widget.list.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: TextX(value.toString(),
                      style:TextStyleX.titleSmall.copyWith(color: Get.theme.iconTheme.color)
                  ),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  value=val;
                });
                widget.onChanged(val);
              },
            ),
          ),
        ],
      ),
    );
  }
}
