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

  const Pitch({
    super.key,
    required this.type,
  });

  @override
  State<Pitch> createState() => _PitchState();
}

class _PitchState extends State<Pitch> {
  List<PitchObject> objects = [];
  final dragTargetKey = GlobalKey();

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
                final focusNode = FocusNode();
                focusNode.requestFocus();
                objects = [
                  ...objects,
                  PitchObject(
                    key: key,
                    object: details.data,
                    offset: offset,
                    scale: scale,
                    focusNode: focusNode,
                    onRemove: (key) {
                      setState(() {
                        debugPrint('remove element');
                        objects.removeWhere((element) => element.key == key);
                      });
                      FocusScope.of(context).unfocus();
                    },
                    onDragComplete: (key) {
                      setState(() {
                        debugPrint('drag remove element');
                        objects.removeWhere((element) => element.key == key);
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
  final double scale;
  final void Function(Key key) onRemove;
  final void Function(Key key) onDragComplete;
  final FocusNode focusNode;

  const PitchObject({
    super.key,
    required this.object,
    required this.offset,
    required this.scale,
    required this.onRemove,
    required this.onDragComplete,
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
            angle: object.angle,
            child: Image.memory(data, scale: 4),
          ),
        );
        return Positioned(
          left: offset.dx * scale,
          top: offset.dy * scale,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                debugPrint('tap');
                focusNode.requestFocus();
              },
              child: Draggable(
                onDragCompleted: () {
                  onDragComplete(key!);
                },
                feedback: child,
                childWhenDragging: const SizedBox.shrink(),
                data: object,
                child: KeyboardListener(
                  focusNode: focusNode,
                  onKeyEvent: (value) {
                    if (value.logicalKey == LogicalKeyboardKey.backspace ||
                        value.logicalKey == LogicalKeyboardKey.delete) {
                      onRemove(key!);
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

  PitchObject copyWith({double scale = 1}) {
    return PitchObject(
      key: key,
      object: object,
      offset: offset,
      scale: scale,
      onRemove: onRemove,
      onDragComplete: onDragComplete,
      focusNode: focusNode,
    );
  }
}

extension on GlobalKey {
  Offset? get globalOffset {
    return currentContext?.findRenderObject()?.maybeAs<RenderBox>()?.localToGlobal(Offset.zero);
  }
}
