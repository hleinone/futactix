import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:futactix/src/design.dart';
import 'package:futactix/src/layout/main_page_platform_menu_bar.dart';
import 'package:futactix/src/util.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();

  static MainPageData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainPageData>()!;
  }
}

class _MainPageState extends State<MainPage> {
  late final l10n = L10n.of(context);
  Pitch pitch = Pitch.football11vs11;

  @override
  Widget build(BuildContext context) {
    return MainPageData(
      pitch: pitch,
      child: Scaffold(
        body: MainPagePlatformMenuBar(
          onSelected: _onMenuItemSelected,
          child: Column(
            children: [
              Toolbar(
                children: [
                  ToolbarGroup(
                    title: l10n.toolbarAttackingPlayer,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ToolbarItem(
                          direction: Direction.forward,
                          child: Icon(
                            Icons.attackingPlayer,
                            color: Colors.blue,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.forward,
                          child: Icon(
                            Icons.attackingPlayer,
                            color: Colors.red,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.forward,
                          child: Icon(
                            Icons.attackingPlayer,
                            color: Colors.yellow,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.forward,
                          child: Icon(
                            Icons.attackingPlayer,
                            color: Colors.grey,
                          ),
                        ),
                      ].intersperse(const SizedBox(width: 8)).toList(),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarDefendingPlayer,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ToolbarItem(
                          direction: Direction.backward,
                          child: Icon(
                            Icons.defendingPlayer,
                            color: Colors.blue,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.backward,
                          child: Icon(
                            Icons.defendingPlayer,
                            color: Colors.red,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.backward,
                          child: Icon(
                            Icons.defendingPlayer,
                            color: Colors.yellow,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.backward,
                          child: Icon(
                            Icons.defendingPlayer,
                            color: Colors.grey,
                          ),
                        ),
                      ].intersperse(const SizedBox(width: 8)).toList(),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarDummy,
                    child: const ToolbarItem(
                      direction: Direction.forward,
                      child: Icon(Icons.dummy),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarHoop,
                    child: const ToolbarItem(
                      child: Icon(
                        Icons.hoop,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarPileOfBalls,
                    child: const ToolbarItem(
                      child: Icon(
                        Icons.attackingPlayer,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarBall,
                    child: const ToolbarItem(
                      child: Icon(
                        Icons.attackingPlayer,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarPoleOnGround,
                    child: const ToolbarItem(
                      child: Icon(
                        Icons.poleOnGround,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarPoleStanding,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ToolbarItem(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Stack(
                              children: [
                                Icon(
                                  Icons.poleStandingBackground,
                                  color: Colors.brightRed,
                                ),
                                Icon(Icons.poleStandingForeground),
                              ],
                            ),
                          ),
                        ),
                        const ToolbarItem(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Stack(
                              children: [
                                Icon(
                                  Icons.poleStandingBackground,
                                  color: Colors.orange,
                                ),
                                Icon(Icons.poleStandingForeground),
                              ],
                            ),
                          ),
                        ),
                      ].intersperse(const SizedBox(width: 4)).toList(),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarMarker,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ToolbarItem(
                          child: Icon(
                            Icons.marker,
                            color: Colors.yellow,
                          ),
                        ),
                        const ToolbarItem(
                          child: Icon(
                            Icons.marker,
                            color: Colors.brightRed,
                          ),
                        ),
                        const ToolbarItem(
                          child: Icon(
                            Icons.marker,
                            color: Colors.blue,
                          ),
                        ),
                      ].intersperse(const SizedBox(width: 4)).toList(),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarCone,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ToolbarItem(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.coneBackground,
                                color: Colors.yellow,
                              ),
                              Icon(Icons.coneForeground),
                            ],
                          ),
                        ),
                        const ToolbarItem(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.coneBackground,
                                color: Colors.brightRed,
                              ),
                              Icon(Icons.coneForeground),
                            ],
                          ),
                        ),
                        const ToolbarItem(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.coneBackground,
                                color: Colors.blue,
                              ),
                              Icon(Icons.coneForeground),
                            ],
                          ),
                        ),
                      ].intersperse(const SizedBox(width: 4)).toList(),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarFence,
                    child: const ToolbarItem(
                      child: Icon(Icons.fence),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarBench,
                    child: const ToolbarItem(
                      child: Icon(
                        Icons.bench,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarLadder,
                    child: const ToolbarItem(
                      child: Icon(Icons.ladder),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarSmallGoal,
                    child: const ToolbarItem(
                      child: Icon(Icons.smallGoal),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarLargeGoal,
                    child: const ToolbarItem(
                      child: Icon(Icons.largeGoal),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarFutsalGoal,
                    child: const ToolbarItem(
                      child: Icon(Icons.futsalGoal),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: ColoredBox(
                    color: pitch.color,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Icon(pitch.image),
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
          pitch = Pitch.football11;
        });
        break;
      case MenuItem.football11vs11:
        setState(() {
          pitch = Pitch.football11vs11;
        });
        break;
      case MenuItem.futsal5vs5:
        setState(() {
          pitch = Pitch.futsal5vs5;
        });
      default:
        // TODO: Implement other menu items
        break;
    }
  }
}

class MainPageData extends InheritedWidget {
  final Pitch pitch;

  const MainPageData({
    super.key,
    required this.pitch,
    required super.child,
  });

  @override
  bool updateShouldNotify(MainPageData oldWidget) => oldWidget.pitch != pitch;
}

enum Pitch {
  football11(axis: Axis.vertical, color: Colors.green, image: Icons.football11),
  football11vs11(axis: Axis.horizontal, color: Colors.green, image: Icons.football11vs11),
  futsal5vs5(axis: Axis.horizontal, color: Colors.parquet, image: Icons.futsal5vs5);

  final Axis axis;
  final Color color;
  final IconData image;

  const Pitch({required this.axis, required this.color, required this.image});
}
