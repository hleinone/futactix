import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:futactix/src/design.dart';
import 'package:futactix/src/layout/main_page_platform_menu_bar.dart';
import 'package:futactix/src/layout/main_page_toolbar.dart';

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
              const MainPageToolbar(),
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
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
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
