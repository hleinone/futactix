import 'dart:math';

import 'package:flutter/services.dart';
import 'package:futactix/src/design.dart';
import 'package:futactix/src/util.dart';

enum PitchType {
  football11._(axis: Axis.vertical, color: Colors.green, image: Icons.football11, size: Size(875, 658)),
  football11vs11._(axis: Axis.horizontal, color: Colors.green, image: Icons.football11vs11, size: Size(658, 438)),
  futsal5vs5._(axis: Axis.horizontal, color: Colors.parquet, image: Icons.futsal5vs5, size: Size(610, 299));

  final Axis axis;
  final Color color;
  final IconData image;
  final Size size;

  const PitchType._({required this.axis, required this.color, required this.image, required this.size});
}

class Pitch extends StatefulWidget {
  final PitchType type;
  final ChangeNotifier clearNotifier;

  const Pitch({
    super.key,
    required this.type,
    required this.clearNotifier,
  });

  @override
  State<Pitch> createState() => _PitchState();
}

class _PitchState extends State<Pitch> {
  List<PitchObject> objects = [];
  final dragTargetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.clearNotifier.addListener(() => setState(objects.clear));
  }

  @override
  void dispose() {
    widget.clearNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: widget.type.size.width,
        maxHeight: widget.type.size.height,
      ),
      child: AspectRatio(
        aspectRatio: widget.type.size.aspectRatio,
        child: LayoutBuilder(builder: (context, constraints) {
          final scale = constraints.biggest.longestSide / widget.type.size.longestSide;
          return DragTarget<ToolbarObject>(
            key: dragTargetKey,
            onWillAcceptWithDetails: (details) {
              final dragTargetOffset = dragTargetKey.globalOffset;
              return dragTargetOffset != null;
            },
            onAcceptWithDetails: (details) {
              final object = details.data;
              final offset = (details.offset - dragTargetKey.globalOffset!) / scale;
              setState(() {
                final key = ValueKey((object, offset));
                final focusNode = FocusNode(skipTraversal: true);
                focusNode.requestFocus();
                objects = [
                  ...objects,
                  PitchObject(
                    key: key,
                    object: object,
                    offset: offset,
                    angle: object.angle,
                    scale: scale,
                    focusNode: focusNode,
                    onRemove: (key) {
                      setState(() {
                        objects.removeWhere((element) => element.key == key);
                      });
                      FocusScope.of(context).unfocus();
                    },
                    onDragComplete: (key, angle) {
                      setState(() {
                        objects.removeWhere((element) => element.key == key);
                      });
                    },
                    onRotate: (key, rotation) {
                      setState(() {
                        objects = objects.map((element) {
                          if (element.key == key) {
                            final angle = element.angle + (rotation == Rotation.clockwise ? pi : -pi) / 16;
                            return element.copyWith(angle: angle);
                          }
                          return element;
                        }).toList();
                      });
                    },
                  )
                ];
              });
            },
            builder: (context, candidateData, rejectedData) {
              return ColoredBox(
                color: widget.type.color,
                child: Stack(
                  children: [
                    Icon(widget.type.image),
                    ...objects.map((e) => e.scale == scale ? e : e.copyWith(scale: scale)),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class PitchObject extends StatelessWidget {
  final ToolbarObject object;
  final Offset offset;
  final double angle;
  final double scale;
  final void Function(Key key) onRemove;
  final void Function(Key key, double angle) onDragComplete;
  final void Function(Key key, Rotation rotation) onRotate;
  final FocusNode focusNode;

  const PitchObject({
    super.key,
    required this.object,
    required this.offset,
    required this.angle,
    required this.scale,
    required this.onRemove,
    required this.onDragComplete,
    required this.onRotate,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: object.image,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return const SizedBox.shrink();
        }
        final child = Transform.scale(
          alignment: Alignment.topLeft,
          scale: scale,
          child: Transform.rotate(
            angle: angle,
            child: ListenableBuilder(
              listenable: focusNode,
              builder: (context, child) {
                if (focusNode.hasFocus) {
                  return child!;
                }
                return child!;
              },
              child: Image.memory(data, scale: 4),
            ),
          ),
        );
        return Positioned(
          left: offset.dx * scale,
          top: offset.dy * scale,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                focusNode.requestFocus();
              },
              child: Draggable(
                onDragStarted: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onDragCompleted: () {
                  onDragComplete(key!, angle);
                },
                feedback: child,
                childWhenDragging: const SizedBox.shrink(),
                data: object.copyWith(angle: angle),
                child: KeyboardListener(
                  focusNode: focusNode,
                  onKeyEvent: (value) {
                    switch (value.logicalKey) {
                      case LogicalKeyboardKey.backspace:
                      case LogicalKeyboardKey.delete:
                        onRemove(key!);
                        break;
                      case LogicalKeyboardKey.arrowRight:
                        onRotate(key!, Rotation.clockwise);
                        break;
                      case LogicalKeyboardKey.arrowLeft:
                        onRotate(key!, Rotation.counterclockwise);
                        break;
                    }
                  },
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  PitchObject copyWith({double? angle, double? scale}) {
    return PitchObject(
      key: key,
      object: object,
      offset: offset,
      angle: angle ?? this.angle,
      scale: scale ?? this.scale,
      onRemove: onRemove,
      onDragComplete: onDragComplete,
      onRotate: onRotate,
      focusNode: focusNode,
    );
  }
}

extension on GlobalKey {
  Offset? get globalOffset {
    return currentContext?.findRenderObject()?.maybeAs<RenderBox>()?.localToGlobal(Offset.zero);
  }
}

enum Rotation { clockwise, counterclockwise }
