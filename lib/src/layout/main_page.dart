import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:futactix/src/design.dart';
import 'package:futactix/src/layout/main_page_platform_menu_bar.dart';
import 'package:futactix/src/util.dart';

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
  Pitch pitch = Pitch.football11vs11;
  List<Widget> objects = [];
  final dragTargetKey = GlobalKey();

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
                    title: l10n.toolbarOffensivePlayer,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ToolbarItem(
                          direction: Direction.forward,
                          child: Icon(
                            Icons.offensivePlayer,
                            color: Colors.blue,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.forward,
                          child: Icon(
                            Icons.offensivePlayer,
                            color: Colors.red,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.forward,
                          child: Icon(
                            Icons.offensivePlayer,
                            color: Colors.yellow,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.forward,
                          child: Icon(
                            Icons.offensivePlayer,
                            color: Colors.grey,
                          ),
                        ),
                      ].intersperse(const SizedBox(width: 8)).toList(),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarDefensivePlayer,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ToolbarItem(
                          direction: Direction.backward,
                          child: Icon(
                            Icons.defensivePlayer,
                            color: Colors.blue,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.backward,
                          child: Icon(
                            Icons.defensivePlayer,
                            color: Colors.red,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.backward,
                          child: Icon(
                            Icons.defensivePlayer,
                            color: Colors.yellow,
                          ),
                        ),
                        const ToolbarItem(
                          direction: Direction.backward,
                          child: Icon(
                            Icons.defensivePlayer,
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
                        Icons.offensivePlayer,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ToolbarGroup(
                    title: l10n.toolbarBall,
                    child: const ToolbarItem(
                      child: Icon(
                        Icons.offensivePlayer,
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
                  child: DragTarget<ToolbarObject>(
                    key: dragTargetKey,
                    onWillAcceptWithDetails: (details) {
                      return true;
                    },
                    onAcceptWithDetails: (details) {
                      final dragTargetOffset =
                          (dragTargetKey.currentContext!.findRenderObject() as RenderBox).localToGlobal(Offset.zero);
                      final localDetails =
                          DragTargetDetails(data: details.data, offset: details.offset - dragTargetOffset);
                      setState(() {
                        final key = ValueKey(details);
                        objects = objects +
                            [
                              FutureBuilder(
                                key: key,
                                future: localDetails.data.image,
                                builder: (context, snapshot) {
                                  final data = snapshot.data;
                                  if (data == null) {
                                    return const SizedBox.shrink();
                                  }
                                  final child = Transform.rotate(
                                    angle: localDetails.data.angle,
                                    child: Image.memory(data),
                                  );
                                  return Positioned(
                                    left: localDetails.offset.dx,
                                    top: localDetails.offset.dy,
                                    child: Draggable(
                                      onDragCompleted: () {
                                        setState(() {
                                          objects.removeWhere((element) => element.key == key);
                                        });
                                      },
                                      feedback: child,
                                      childWhenDragging: const SizedBox.shrink(),
                                      data: details.data,
                                      child: child,
                                    ),
                                  );
                                },
                              )
                            ];
                      });
                    },
                    builder: (context, candidateData, rejectedData) {
                      return ColoredBox(
                        color: pitch.color,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Icon(pitch.image),
                            ),
                            ...objects,
                          ],
                        ),
                      );
                    },
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
          objects = [];
        });
        break;
      case MenuItem.football11vs11:
        setState(() {
          pitch = Pitch.football11vs11;
          objects = [];
        });
        break;
      case MenuItem.futsal5vs5:
        setState(() {
          pitch = Pitch.futsal5vs5;
          objects = [];
        });
      case MenuItem.removeObjects:
        setState(() {
          objects = [];
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
