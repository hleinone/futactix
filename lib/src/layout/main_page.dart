import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:futactix/src/design.dart';
import 'package:futactix/src/layout/main_page_platform_menu_bar.dart';
import 'package:futactix/src/layout/main_page_toolbar.dart';
import 'package:futactix/src/layout/pitch.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();

  static MainPageData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainPageData>()!;
  }
}

class _MainPageState extends State<MainPage> {
  late final l10n = L10n.of(context);
  PitchType type = PitchType.football11vs11;

  @override
  Widget build(BuildContext context) {
    return MainPageData(
      pitch: type,
      child: Scaffold(
        body: MainPagePlatformMenuBar(
          onSelected: _onMenuItemSelected,
          child: Column(
            children: [
              const MainPageToolbar(),
              Expanded(child: Center(child: Pitch(type: type))),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: ColoredBox(
                    color: Colors.transparent,
                    child: Center(
                      child: Pitch(
                        type: type,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onMenuItemSelected(MenuItem item) {
    switch (item) {
      case MenuItem.quit:
        SystemNavigator.pop();
        break;
      case MenuItem.football11:
        setState(() {
          type = PitchType.football11;
        });
        break;
      case MenuItem.football11vs11:
        setState(() {
          type = PitchType.football11vs11;
        });
        break;
      case MenuItem.futsal5vs5:
        setState(() {
          type = PitchType.futsal5vs5;
        });
      case MenuItem.removeObjects:
        setState(() {
          //objects = [];
        });
      default:
        // TODO: Implement other menu items
        break;
    }
  }
}

class MainPageData extends InheritedWidget {
  final PitchType pitch;

  const MainPageData({
    super.key,
    required this.pitch,
    required super.child,
  });

  @override
  bool updateShouldNotify(MainPageData oldWidget) => oldWidget.pitch != pitch;
}
