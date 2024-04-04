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

class ToolbarIcon extends StatelessWidget {
  final ToolbarIconData icon;
  final Color? color;
  final ColorFilter? colorFilter;
  final Color? strokeColor;
  final ColorFilter? strokeColorFilter;

  const ToolbarIcon(
    this.icon, {
    super.key,
    this.color,
    this.colorFilter,
    this.strokeColor,
    this.strokeColorFilter,
  }) : assert((color == null || colorFilter == null) && (strokeColor == null || strokeColorFilter == null));

  @override
  Widget build(BuildContext context) {
    switch (icon) {
      case _SimpleToolbarIconData(assetPath: final assetPath):
        return _buildSimpleIcon(assetPath, icon.strokeAssetPath);
      case _DualLayerToolbarIconData(
          foregroundAssetPath: final foregroundAssetPath,
          backgroundAssetPath: final backgroundAssetPath
        ):
        return _buildDualLayerIcon(foregroundAssetPath, backgroundAssetPath, icon.strokeAssetPath);
    }
  }

  Widget _buildSimpleIcon(String path, String strokePath) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          path,
          colorFilter: colorFilter ?? color?.let((c) => ColorFilter.mode(c, BlendMode.srcIn)),
        ),
        SvgPicture.asset(
          strokePath,
          colorFilter: strokeColorFilter ?? strokeColor?.let((c) => ColorFilter.mode(c, BlendMode.srcIn)),
        ),
      ],
    );
  }

  Widget _buildDualLayerIcon(String foregroundPath, String backgroundPath, String strokePath) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          backgroundPath,
          colorFilter: colorFilter ?? color?.let((c) => ColorFilter.mode(c, BlendMode.srcIn)),
        ),
        SvgPicture.asset(foregroundPath),
        SvgPicture.asset(
          strokePath,
          colorFilter: strokeColorFilter ?? strokeColor?.let((c) => ColorFilter.mode(c, BlendMode.srcIn)),
        ),
      ],
    );
  }
}

sealed class ToolbarIconData {
  final String strokeAssetPath;

  const ToolbarIconData._({
    required this.strokeAssetPath,
  });
}

class _SimpleToolbarIconData extends ToolbarIconData {
  final String assetPath;

  const _SimpleToolbarIconData._({
    required this.assetPath,
    required super.strokeAssetPath,
  }) : super._();
}

class _DualLayerToolbarIconData extends ToolbarIconData {
  final String foregroundAssetPath;
  final String backgroundAssetPath;

  const _DualLayerToolbarIconData._({
    required this.foregroundAssetPath,
    required this.backgroundAssetPath,
    required super.strokeAssetPath,
  }) : super._();
}

class ToolbarIcons {
  const ToolbarIcons._();

  static const ToolbarIconData offensivePlayer = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/offensive_player.svg',
    strokeAssetPath: 'assets/vector/offensive_player_stroke.svg',
  );
  static const ToolbarIconData defensivePlayer = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/defensive_player.svg',
    strokeAssetPath: 'assets/vector/defensive_player_stroke.svg',
  );
  static const ToolbarIconData dummy = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/dummy.svg',
    strokeAssetPath: 'assets/vector/dummy_stroke.svg',
  );
  static const ToolbarIconData hoop = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/hoop.svg',
    strokeAssetPath: 'assets/vector/hoop_stroke.svg',
  );
  static const ToolbarIconData pileOfBalls = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/pile_of_balls.svg',
    strokeAssetPath: 'assets/vector/pile_of_balls_stroke.svg',
  );
  static const ToolbarIconData ball = _DualLayerToolbarIconData._(
    foregroundAssetPath: 'assets/vector/ball_foreground.svg',
    backgroundAssetPath: 'assets/vector/ball_background.svg',
    strokeAssetPath: 'assets/vector/ball_stroke.svg',
  );
  static const ToolbarIconData poleOnGround = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/pole_on_ground.svg',
    strokeAssetPath: 'assets/vector/pole_on_ground_stroke.svg',
  );
  static const ToolbarIconData poleStanding = _DualLayerToolbarIconData._(
    foregroundAssetPath: 'assets/vector/pole_standing_foreground.svg',
    backgroundAssetPath: 'assets/vector/pole_standing_background.svg',
    strokeAssetPath: 'assets/vector/pole_standing_stroke.svg',
  );
  static const ToolbarIconData marker = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/marker.svg',
    strokeAssetPath: 'assets/vector/marker_stroke.svg',
  );
  static const ToolbarIconData cone = _DualLayerToolbarIconData._(
    foregroundAssetPath: 'assets/vector/cone_foreground.svg',
    backgroundAssetPath: 'assets/vector/cone_background.svg',
    strokeAssetPath: 'assets/vector/cone_stroke.svg',
  );
  static const ToolbarIconData fence = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/fence.svg',
    strokeAssetPath: 'assets/vector/fence_stroke.svg',
  );
  static const ToolbarIconData bench = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/bench.svg',
    strokeAssetPath: 'assets/vector/bench_stroke.svg',
  );
  static const ToolbarIconData ladder = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/ladder.svg',
    strokeAssetPath: 'assets/vector/ladder_stroke.svg',
  );
  static const ToolbarIconData smallGoal = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/small_goal.svg',
    strokeAssetPath: 'assets/vector/small_goal_stroke.svg',
  );
  static const ToolbarIconData largeGoal = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/large_goal.svg',
    strokeAssetPath: 'assets/vector/large_goal_stroke.svg',
  );
  static const ToolbarIconData futsalGoal = _SimpleToolbarIconData._(
    assetPath: 'assets/vector/futsal_goal.svg',
    strokeAssetPath: 'assets/vector/futsal_goal_stroke.svg',
  );
}
