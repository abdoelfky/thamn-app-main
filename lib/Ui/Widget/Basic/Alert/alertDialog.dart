part of widget;

class AlertDialogX {
  static child({
    required Widget child,
    String title = '',
  }) {
    Get.defaultDialog(
      title: title.tr,
      titleStyle: TextStyleX.titleLarge,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      radius: StyleX.radius,
      content: child,
    );
  }
  static loading(){
    return Get.dialog( const Center(child: CircularProgressIndicator()));
  }
  static okAndCancel({
    required String title,
    required String message,
    String? textOK,
    String? textOK2,
    String? textCancel,
    Color? colorTextOk,
    Color? colorTextOk2,
    Color? colorTextCancel,
    bool isShowCancel=true,
    required void Function() onOk,
    void Function()? onOk2,
    void Function()? onCancel,
  }) {
    Get.defaultDialog(
      title: title.tr,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      radius: StyleX.radius,
      titleStyle: TextStyleX.titleLarge,
      titlePadding: const EdgeInsets.only(top: 10),
      content: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextX(
                  message,
                  style: TextStyleX.titleSmall,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: isShowCancel?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
            children: [
              if(isShowCancel)
                TextButton(
                  onPressed: () {
                    onCancel ?? Get.back();
                  },
                  child: TextX(
                    textCancel ?? "Cancel",
                    style: TextStyleX.titleSmall,
                    color: colorTextCancel,
                  ),
                ),
              if(isShowCancel)
                const SizedBox(width: 16),
              TextButton(
                onPressed: (){
                  Get.back();
                  onOk();
                },
                child: TextX(
                    textOK ?? "OK",
                    style: TextStyleX.titleSmall,
                    color: colorTextOk ?? ColorX.primary
                ),
              ),
              if(textOK2!=null)
                const SizedBox(width: 16),
              if(textOK2!=null)
              TextButton(
                onPressed: (){
                  Get.back();
                  onOk2!();
                },
                child: TextX(
                    textOK2,
                    style: TextStyleX.titleSmall,
                    color: colorTextOk2 ?? ColorX.primary
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}
