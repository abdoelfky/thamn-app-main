part of widget;

class TextFieldDateX extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool disabled;
  final EdgeInsets margin;
  final IconData? icon;
  final DateTime? lastDate;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final String? Function(String?)? validate;
  final Function(DateTime?)? onChange;
  const TextFieldDateX({super.key,
    required this.controller,
    required this.hint,
    this.validate,
    this.initialDate,
    this.lastDate,
    this.firstDate,
    this.disabled = false,
    this.margin = const EdgeInsets.symmetric(vertical:8),
    this.icon, this.onChange,
  });

  @override
  State<TextFieldDateX> createState() => _TextFieldDateXState();
}

class _TextFieldDateXState extends State<TextFieldDateX> {
  
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      margin: widget.margin,
      padding: const EdgeInsets.all(12),
      color: (widget.disabled == true) ? ColorX.greyDark.shade100 : null,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validate,
        keyboardType: TextInputType.datetime,
        textInputAction: TextInputAction.done,
        style: TextStyleX.titleSmall,
        focusNode: AlwaysDisabledFocusNode(),
        readOnly: widget.disabled,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(prefixIcon: widget.icon!=null?Icon(widget.icon, size: 22.0):null,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none,
          hintText: widget.hint.tr,
          isCollapsed: true,
          helperStyle: TextStyleX.supTitleMedium,
        ),
        onTap: () async{
          FocusScope.of(context).requestFocus(FocusNode());
          DateTime? date = await showDatePicker(
              context: context,
              initialDate:widget.initialDate??widget.lastDate??DateTime(DateTime.now().year-16),
              firstDate:widget.firstDate??DateTime(1900),
              lastDate: widget.lastDate??DateTime(DateTime.now().year-16),
          );
          widget.controller.text = date!=null?'${date.year}-${date.month}-${date.day}':'';
          if(widget.onChange!=null){
            widget.onChange!(date);
          }
        },
      ),
    );
  }
}


class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}