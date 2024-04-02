part of '../design.dart';

class Icon extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final ColorFilter? colorFilter;

  const Icon(
    this.icon, {
    super.key,
    this.color,
    this.colorFilter,
  }) : assert(color == null || colorFilter == null);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon!.assetPath,
      colorFilter: colorFilter ?? (color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null),
    );
  }
}

class IconData {
  final String assetPath;
  const IconData._(this.assetPath);
}

class Icons {
  const Icons._();

  static const IconData offensivePlayer = IconData._('assets/vector/offensive_player.svg');
  static const IconData defensivePlayer = IconData._('assets/vector/defensive_player.svg');
  static const IconData dummy = IconData._('assets/vector/dummy.svg');
  static const IconData hoop = IconData._('assets/vector/hoop.svg');
  static const IconData pileOfBalls = IconData._('assets/vector/pile_of_balls.svg');
  static const IconData ballBackground = IconData._('assets/vector/ball_background.svg');
  static const IconData ballForeground = IconData._('assets/vector/ball_foreground.svg');
  static const IconData poleOnGround = IconData._('assets/vector/pole_on_ground.svg');
  static const IconData poleStandingBackground = IconData._('assets/vector/pole_standing_background.svg');
  static const IconData poleStandingForeground = IconData._('assets/vector/pole_standing_foreground.svg');
  static const IconData marker = IconData._('assets/vector/marker.svg');
  static const IconData coneBackground = IconData._('assets/vector/cone_background.svg');
  static const IconData coneForeground = IconData._('assets/vector/cone_foreground.svg');
  static const IconData fence = IconData._('assets/vector/fence.svg');
  static const IconData bench = IconData._('assets/vector/bench.svg');
  static const IconData ladder = IconData._('assets/vector/ladder.svg');
  static const IconData smallGoal = IconData._('assets/vector/small_goal.svg');
  static const IconData largeGoal = IconData._('assets/vector/large_goal.svg');
  static const IconData futsalGoal = IconData._('assets/vector/futsal_goal.svg');
  static const IconData football11 = IconData._('assets/vector/football_11.svg');
  static const IconData football11vs11 = IconData._('assets/vector/football_11_vs_11.svg');
  static const IconData futsal5vs5 = IconData._('assets/vector/futsal_5_vs_5.svg');
}
