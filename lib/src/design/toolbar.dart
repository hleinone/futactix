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
  final Widget child;
  final Direction? direction;

  const ToolbarItem({super.key, required this.child, this.direction});

  @override
  Widget build(BuildContext context) {
    final angle = direction?.let((direction) {
      final axis = MainPage.of(context).pitch.axis;
      return direction.angle - (axis == Axis.horizontal ? math.pi / 2 : 0);
    });
    final child = Container(
      color: Colors.transparent,
      height: 40,
      child: Center(
        widthFactor: 1,
        child: this.child,
      ),
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Draggable(
        feedback: angle != null ? Transform.rotate(angle: angle, child: child) : child,
        child: child,
      ),
    );
  }
}

enum Direction {
  forward(angle: 0),
  backward(angle: math.pi);

  final double angle;

  const Direction({required this.angle});
}
