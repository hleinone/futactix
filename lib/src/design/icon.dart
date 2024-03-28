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

  static const IconData attackingPlayer = IconData._('assets/vector/attacking_player.svg');
  static const IconData defendingPlayer = IconData._('assets/vector/defending_player.svg');
  static const IconData dummy = IconData._('assets/vector/dummy.svg');
  static const IconData hoop = IconData._('assets/vector/hoop.svg');
  static const IconData poleOnGround = IconData._('assets/vector/pole_on_ground.svg');
  static const IconData poleStandingBackground = IconData._('assets/vector/pole_standing_background.svg');
  static const IconData poleStandingForeground = IconData._('assets/vector/pole_standing_foreground.svg');
  static const IconData marker = IconData._('assets/vector/marker.svg');
}
