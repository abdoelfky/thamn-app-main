part of widget;

class WebOptionsX extends StatelessWidget {
  const WebOptionsX(
      {required this.isSelectionText, Key? key, required this.materialApp})
      : super(key: key);
  final bool isSelectionText;
  final Widget materialApp;
  @override
  Widget build(BuildContext context) {
    if (isSelectionText) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SelectionArea(
          child: materialApp,
        ),
      );
    } else {
      return materialApp;
    }
  }
}
