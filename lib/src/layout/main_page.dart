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
                      final localDetails = DragTargetDetails(
                        data: details.data,
                        offset: details.offset - dragTargetOffset,
                      );
                      setState(() {
                        final key = ValueKey(localDetails);
                        final focusNode = FocusNode();
                        focusNode.requestFocus();
                        objects = [
                          ...objects,
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
                                child: Image.memory(data, scale: 4),
                              );
                              return Positioned(
                                left: localDetails.offset.dx,
                                top: localDetails.offset.dy,
                                child: KeyboardListener(
                                  focusNode: focusNode,
                                  onKeyEvent: (value) {
                                    if (value.logicalKey == LogicalKeyboardKey.backspace ||
                                        value.logicalKey == LogicalKeyboardKey.delete) {
                                      setState(() {
                                        objects.removeWhere((element) => element.key == key);
                                      });
                                      FocusScope.of(context).unfocus();
                                    }
                                  },
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
                                ),
                              );
                            },
                          ),
                        ];
                      });
                    },
                    builder: (context, candidateData, rejectedData) {
                      return PitchView(
                        pitch: pitch,
                        objects: objects,
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
  football11._(axis: Axis.vertical, color: Colors.green, image: Icons.football11, size: Size(875, 658)),
  football11vs11._(axis: Axis.horizontal, color: Colors.green, image: Icons.football11vs11, size: Size(658, 438)),
  futsal5vs5._(axis: Axis.horizontal, color: Colors.parquet, image: Icons.futsal5vs5, size: Size(610, 299));

  final Axis axis;
  final Color color;
  final IconData image;
  final Size size;

  const Pitch._({required this.axis, required this.color, required this.image, required this.size});
}

class PitchView extends StatelessWidget {
  final Pitch pitch;
  final List<Widget> objects;

  const PitchView({
    super.key,
    required this.pitch,
    required this.objects,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: pitch.size.width,
        maxHeight: pitch.size.height,
      ),
      child: AspectRatio(
        aspectRatio: pitch.size.aspectRatio,
        child: LayoutBuilder(builder: (context, constraints) {
          final scale = constraints.biggest.longestSide / pitch.size.longestSide;
          return ColoredBox(
            color: pitch.color,
            child: Stack(
              children: [
                Icon(pitch.image),
                ...objects,
              ],
            ),
          );
        }),
      ),
    );
  }
}

}
