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

  static const IconData football11 = IconData._('assets/vector/football_11.svg');
  static const IconData football11vs11 = IconData._('assets/vector/football_11_vs_11.svg');
  static const IconData futsal5vs5 = IconData._('assets/vector/futsal_5_vs_5.svg');
}
