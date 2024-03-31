part of '../design.dart';

class Toolbar extends StatelessWidget {
  final List<Widget> children;

  const Toolbar({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black,
      elevation: 5,
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            spacing: 16,
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            runSpacing: 8,
            children: children,
          ),
        ),
      ),
    );
  }
}

class ToolbarGroup extends StatelessWidget {
  final String title;
  final Widget? child;

  const ToolbarGroup({
    super.key,
    required this.title,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title.toLocalizedUpperCase(Localizations.localeOf(context)),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}

class ToolbarItem extends StatelessWidget {
  final Direction? direction;
  final Widget child;

  const ToolbarItem({
    super.key,
    this.direction,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final angle = direction?.let((direction) {
      final axis = MainPage.of(context).pitch.axis;
      return direction.angle - axis.angle;
    });
    final child = Container(
      color: Colors.transparent,
      height: 40,
      child: Center(
        widthFactor: 1,
        child: this.child,
      ),
    );
    final key = GlobalKey();
    final data = ToolbarObject(imageKey: key, imageResolver: captureWidget, angle: angle ?? 0);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Draggable(
        maxSimultaneousDrags: 1,
        data: data,
        feedback: angle != null ? Transform.rotate(angle: angle, child: child) : child,
        child: RepaintBoundary(
          key: key,
          child: child,
        ),
      ),
    );
  }

  Future<Uint8List> captureWidget(GlobalKey key) async {
    final boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }
}

enum Direction {
  forward(angle: 0),
  backward(angle: math.pi);

  final double angle;

  const Direction({required this.angle});
}

extension on Axis {
  double get angle => this == Axis.horizontal ? math.pi / 2 : 0;
}

class ToolbarObject {
  final GlobalKey imageKey;
  final Future<Uint8List> Function(GlobalKey) imageResolver;
  final double angle;
  Future<Uint8List> get image => imageResolver(imageKey);

  const ToolbarObject({required this.imageKey, required this.imageResolver, required this.angle});
}
