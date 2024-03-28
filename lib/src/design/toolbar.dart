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
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children.intersperse(const _Separator()).toList(),
        ),
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.grey,
      width: 1,
      height: 60,
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
        mainAxisSize: MainAxisSize.max,
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
          if (child != null) Expanded(child: child!),
        ],
      ),
    );
  }
}
