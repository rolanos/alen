import 'package:alen/features/core/color_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MenuScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: ColorsUi.purple,
          borderRadius: BorderRadius.vertical(top: Radius.circular(45.0)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(45.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        widget.navigationShell
                            .goBranch(0, initialLocation: true);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          "assets/icons/profil.svg",
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        widget.navigationShell
                            .goBranch(1, initialLocation: true);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          "assets/icons/tasks.svg",
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: InkWell(
                  //     onTap: () {
                  //       widget.navigationShell
                  //           .goBranch(2, initialLocation: true);
                  //     },
                  //     child: Container(
                  //       alignment: Alignment.center,
                  //       child: SvgPicture.asset(
                  //         "assets/icons/profil.svg",
                  //         width: 60,
                  //         height: 60,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: widget.navigationShell,
    );
  }
}
