part of widget;

class TextFieldX extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool disabled;
  final bool autofocus;
  final EdgeInsets margin;
  final IconData? icon;
  final bool isPassword;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  TextFieldX({
    required this.controller,
    required this.hint,
    this.validate,
    this.autofocus = false,
    this.textInputType,
    this.textInputAction,
    this.isPassword = false,
    this.disabled = false,
    this.margin = const EdgeInsets.symmetric(vertical: 5),
    this.icon,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
  });

  @override
  State<TextFieldX> createState() => _TextFieldXState();
}

class _TextFieldXState extends State<TextFieldX> {
  late bool passwordVisible;
  @override
  void initState() {
    passwordVisible = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      margin: widget.margin,
      padding: const EdgeInsets.all(12),
      color: (widget.disabled == true) ? ColorX.greyDark.shade100 : null,
      child: TextFormField(
        maxLength: widget.maxLength,
        minLines: widget.minLines,
        style: TextStyleX.titleSmall,
        autofocus: widget.autofocus,
        onChanged: widget.onChanged,
        validator: widget.validate,
        readOnly: widget.disabled,
        obscureText: passwordVisible,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        maxLines: widget.maxLines,
        textAlignVertical: TextAlignVertical.center,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.icon!=null?Icon(widget.icon, size: 22.0):null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    passwordVisible ? Iconsax.eye : Iconsax.eye_slash,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                )
              : null,
          helperStyle:  TextStyleX.supTitleMedium.copyWith(color: ColorX.primary.shade700),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none,
          isCollapsed: true,
          hintText: widget.hint.tr,
        ),
      ),
    );
  }
}
