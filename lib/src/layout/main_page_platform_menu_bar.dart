import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class MainPagePlatformMenuBar extends StatelessWidget {
  final Widget? child;

  const MainPagePlatformMenuBar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return PlatformMenuBar(
      menus: [
        PlatformMenu(
          label: l10n.title,
          menus: [
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarAbout,
                  onSelected: () {
                    print('Clicked About Futactix');
                  },
                ),
              ],
            ),
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarSettings,
                  onSelected: () {
                    print('Clicked Settings');
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.comma,
                    meta: true,
                  ),
                ),
              ],
            ),
            PlatformMenuItem(
              label: l10n.menubarQuit,
              onSelected: () {
                print('Clicked Quit');
                SystemNavigator.pop();
              },
              shortcut: const SingleActivator(
                LogicalKeyboardKey.keyQ,
                meta: true,
              ),
            ),
          ],
        ),
        PlatformMenu(
          label: l10n.menubarFile,
          menus: [
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarNewProject,
                  onSelected: () {
                    print('Clicked File > New Project');
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.keyN,
                    meta: true,
                  ),
                ),
                PlatformMenuItem(
                  label: l10n.menubarOpen,
                  onSelected: () {
                    print('Clicked File > Open');
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.keyO,
                    meta: true,
                  ),
                ),
                PlatformMenuItem(
                  label: l10n.menubarSave,
                  onSelected: () {
                    print('Clicked File > Save');
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.keyS,
                    meta: true,
                  ),
                ),
              ],
            ),
          ],
        ),
        PlatformMenu(
          label: l10n.menubarEdit,
          menus: [
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarUndo,
                  onSelected: () {
                    print('Clicked Edit > Undo');
                  },
                  shortcut: const SingleActivator(
                    LogicalKeyboardKey.keyZ,
                    meta: true,
                  ),
                ),
                PlatformMenuItem(
                  label: l10n.menubarClear,
                  onSelected: () {
                    print('Clicked Edit > Clear Drawings');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarRemoveObjects,
                  onSelected: () {
                    print('Clicked Edit > Remove Objects');
                  },
                ),
              ],
            ),
          ],
        ),
        PlatformMenu(
          label: l10n.menubarFormations,
          menus: [
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarFootball5,
                  onSelected: () {
                    print('Clicked Formations > Football 5');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball8,
                  onSelected: () {
                    print('Clicked Formations > Football 8');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball11,
                  onSelected: () {
                    print('Clicked Formations > Football 11');
                  },
                ),
              ],
            ),
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarFootball5vs5,
                  onSelected: () {
                    print('Clicked Formations > Football 5 vs 5');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball8vs8,
                  onSelected: () {
                    print('Clicked Formations > Football 8 vs 8');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFootball11vs11,
                  onSelected: () {
                    print('Clicked Formations > Football 11 vs 11');
                  },
                ),
              ],
            ),
            PlatformMenuItemGroup(
              members: [
                PlatformMenuItem(
                  label: l10n.menubarFutsal5,
                  onSelected: () {
                    print('Clicked Formations > Futsal 5');
                  },
                ),
                PlatformMenuItem(
                  label: l10n.menubarFutsal5vs5,
                  onSelected: () {
                    print('Clicked Formations > Futsal 5 vs 5');
                  },
                ),
              ],
            ),
          ],
        ),
      ],
      child: child,
    );
  }
}
