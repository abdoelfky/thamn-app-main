part of widget;

class LanguageButtonX extends StatefulWidget {
  const LanguageButtonX({super.key});

  @override
  State<LanguageButtonX> createState() => _LanguageButtonXState();
}

class _LanguageButtonXState extends State<LanguageButtonX> {
  bool ar = LocalDataX.settings.language=='ar';
  late final _controller = ValueNotifier<bool>(ar);

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        if (_controller.value) {
          ar = true;
        } else {
          ar = false;
        }
      });
      changeLanguage();
    });
  }
  changeLanguage() async {
    try {
      await TranslationX.changeLocale(ar?'ar':'en');
      LocalDataX.settings.language = ar?'ar':'en';
      LocalDataX.put(LocalNames.settings, LocalDataX.settings.toJson());
    } catch (e) {
      ToastX.error(message: e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: _controller,
      activeColor: ColorX.primary,
      inactiveColor: ColorX.grey,
      activeChild: ar?const TextX('عربي',color: Colors.white):TextX('EN',color: ColorX.primary),
      inactiveChild: ar?const TextX('عربي',color: Colors.white):TextX('EN',color: ColorX.primary),
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      width: 85.0,
      height: 35.0,
      enabled: true,
      disabledOpacity: 0.5,
    );
  }
}
